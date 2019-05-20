import Foundation

public class Reducer<T> {
    private let nextTry: (Int) -> Future<[T]>
    private let onSuccess: ([T]) -> Void
    private let total: Int
    private let queue = DispatchQueue(label: "reduction.queue", attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 3)
    
    public private(set) var progress: Int = 0
    
    public init(total: Int, nextTry: @escaping (Int) -> Future<[T]>, onSuccess: @escaping ([T]) -> Void) {
        self.total = total
        self.nextTry = nextTry
        self.onSuccess = onSuccess
    }
    
    public func start() -> Future<Bool> {
        let promise = Promise<Bool>()
        
        for i in 0...self.total {
            queue.async { [weak self] in
                guard let strongSelf = self else { return }
                
                strongSelf.semaphore.wait()
                strongSelf.nextTry(i).observe { [weak self] in
                    switch $0 {
                    case .success(let result):
                        strongSelf.progress += 1
                        DispatchQueue.main.async { [weak self] in
                            self?.onSuccess(result)
                        }
                    case .failure(_):
                        sleep(500)
                    }
                }
                
                if strongSelf.progress == strongSelf.total {
                    promise.resolve(with: true)
                }
                
                strongSelf.semaphore.signal()
            }
        }
        
        return promise 
    }
}

