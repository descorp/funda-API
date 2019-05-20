import UIKit
import FundaApi
import ApiProvider

class _k {}
let bundle = Bundle(for: _k.self)
let builder = FundaRequestBuilder(with: Configuration(bundle: bundle))
let fundaAPI = RemoteApiProvider(with:  builder)


fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam"))
    .transform { $0.totaalAantalObjecten }
    .than { fundaAPI.request(Endpoint.get(type: .koop, size: $0, search: "amsterdam")) }
    .transform { $0.objects ?? [] }
    .transform { Dictionary(grouping: $0) { $0.makelaarNaam } }
    .transform { $0.sorted(by: { $0.value.count > $1.value.count }) }
    .transform { $0.prefix(10) }
    .observe { promis in
        print("Assignmen 1\r")
        switch promis {
        case .success(let value):
            var position = 1
            value.forEach {
                print("#\(position) \($0.key) - \($0.value.count)")
                position += 1
            }
            break
        case .failure(let error):
            print("Error: - \(error)")
            break
        }
}


// assignment 2
fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam", "tuin"))
    .transform { $0.totaalAantalObjecten }
    .than { fundaAPI.request(Endpoint.get(type: .koop, size: $0, search: "amsterdam", "tuin")) }
    .transform { $0.objects ?? [] }
    .transform { Dictionary(grouping: $0) { $0.makelaarNaam } }
    .transform { $0.sorted(by: { $0.value.count > $1.value.count }) }
    .transform { $0.prefix(10) }
    .observe { promis in
        print("\rAssignmen 2\r")
        switch promis {
        case .success(let value):
            var position = 1
            value.forEach {
                print("#\(position) \($0.key) - \($0.value.count)")
                position += 1
            }
            break
        case .failure(let error):
            print("Error: \(error)")
            break
        }
}

