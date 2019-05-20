import Foundation
import ApiProviderMac

public extension RemoteApiProvider {
    func request<T>(_ endpoint: Endpoint<T>) -> Future<T> {
        let promise = Promise<T>()
        self.request(endpoint) { response in
            switch response {
            case .success(let result):
                promise.resolve(with: result)
            case .failure(let error):
                promise.reject(with: error)
            }
        }
        
        return promise
    }
}
