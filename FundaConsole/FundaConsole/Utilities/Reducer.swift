import Foundation

public class Reducer<T> {
    private let nextTry: (Int) -> Future<[T]>
    private let onSuccess: ([T]) -> Void
    private let total: Int
    private let queue: DispatchQueue
    private let semaphore = DispatchSemaphore(value: 1)
    
    public init(total: Int, nextTry: @escaping (Int) -> Future<[T]>, onSuccess: @escaping ([T]) -> Void) {
        self.total = total
        self.nextTry = nextTry
        self.onSuccess = onSuccess
        queue = DispatchQueue(label: "reduction.queue\(total)", qos: .userInitiated)
    }
    
    public func start(verbose: Bool = true) -> Future<Bool> {
        let promise = Promise<Bool>()
        if (verbose) { print("Processing..") }
        var step = 0
        queue.async {
            while step < self.total {
                self.semaphore.wait()
                self.nextTry(step).observe {
                    switch $0 {
                    case .success(let result):
                        step += 1
                        self.onSuccess(result)
                        if (verbose) { DispatchQueue.main.async { print("Progress: \(self.total) / \(step)") } }
                    case .failure(_):
                        if verbose { DispatchQueue.main.async { print("Waiting..") } }
                        sleep(15)
                    }
                    self.semaphore.signal()
                }
            }
            promise.resolve(with: true)
        }
        
        return promise 
    }
}

