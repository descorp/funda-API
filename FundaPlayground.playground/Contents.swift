import UIKit
import FundaApi
import ApiProvider


class _k {}
let bundle = Bundle(for: _k.self)
let config = Configuration(bundle: bundle)
let builder = FundaRequestBuilder(with: config)
let fundaAPI = RemoteApiProvider(with:  builder)

// assignment 1

let makelaar = fundaAPI.request(Endpoint.get(type: .makelaars, search: "amsterdam",
                                                                        "soortaanbod-koopwoningen")) { response in
    switch response {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}


// assignment 2

let objects = fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam",
    "soortaanbod-koopwoningen")) { response in
        switch response {
        case .success(let result):
            print(result)
        case .failure(let error):
            print(error)
        }
}
