import Foundation

public class Reducer<T> {
    private let nextTry: (Int) -> Future<[T]>
    private let onSuccess: ([T]) -> Void
    private let total: Int
    private lazy var inProgress: [IndexPath: Operation] = [:]
    private lazy var queue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "reduction queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    public private(set) var page: Int = 0
    
    public init(total: Int, nextTry: @escaping (Int) -> Future<[T]>, onSuccess: @escaping ([T]) -> Void) {
        self.total = total
        self.nextTry = nextTry
        self.onSuccess = onSuccess
    }
    
    public func start() -> Future<Bool> {
        let promise = Promise<Bool>()
        queue.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.nextTry(strongSelf.page).observe { [weak self] in
                switch $0 {
                case .success(let result):
                    DispatchQueue.main.async { [weak self] in
                        self?.onSuccess(result)
                    }
                case .failure(_):
                    sleep(500)
                }
                
                self?.page += 1
                if self?.page == self?.total {
                    promise.resolve(with: true)
                } else {
                    
                }
            }
        }
        return promise 
    }
}

class ReductionOperation<T>: Operation {
    
    private let onSuccess: ([T]) -> Void
    private let nextTry: (Int) -> Future<[T]>
    private var page: Int
    
    init(page: Int, nextTry: @escaping (Int) -> Future<[T]>, onSuccess: @escaping ([T]) -> Void) {
        self.page = page
        self.nextTry = nextTry
        super.init()
    }
    
    override func main () {
        if isCancelled {
            return
        }
        
        self.nextTry(self.page).observe { [weak self] in
            switch $0 {
            case .success(let result):
                DispatchQueue.main.async { [weak self] in
                    self?.onSuccess(result)
                }
            case .failure(_):
                sleep(500)
            }
            
            self?.page += 1
            if self?.page == self?.total {
                promise.resolve(with: true)
            } else {
                
            }
        }
    }
}
