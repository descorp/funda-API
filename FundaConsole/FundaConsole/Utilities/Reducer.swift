import Foundation

public class Reducer<T> {
    private let nextTry: (Int) -> Future<[T]>
    private let onSuccess: ([T]) -> Void
    private let total: Int
    private let queue = DispatchQueue(label: "reduction.queue", qos: .userInitiated, attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 3)
    
    public private(set) var progress: Int = 0
    
    public init(total: Int, nextTry: @escaping (Int) -> Future<[T]>, onSuccess: @escaping ([T]) -> Void) {
        self.total = total
        self.nextTry = nextTry
        self.onSuccess = onSuccess
    }
    
    public func start(verbose: Bool = true) -> Future<Bool> {
        let promise = Promise<Bool>()
        print("Processing..")
        var oldProgress = progress
        queue.async { [weak self] in
            guard let strongSelf = self else { return }
            
            for i in 0...strongSelf.total {
                strongSelf.semaphore.wait()
                strongSelf.nextTry(i).observe { [weak self] in
                    guard let strongSelf = self else { return }
                    switch $0 {
                    case .success(let result):
                        strongSelf.progress += 1
                        strongSelf.onSuccess(result)
                    case .failure(_):
                        if verbose { DispatchQueue.main.async { print("waiting..") } }
                        
                        sleep(10)
                    }
                    
                    let progress = Int(Double(strongSelf.progress) / Double(strongSelf.total) * 100)
                    if (verbose && oldProgress != progress) {
                        DispatchQueue.main.async { print("Progress: \(progress)%") }
                        oldProgress = progress
                    }
                    
                    if strongSelf.progress >= strongSelf.total {
                        print("Done!")
                        promise.resolve(with: true)
                    }
                    
                    strongSelf.semaphore.signal()
                }
            }
        }
        
        return promise 
    }
}

