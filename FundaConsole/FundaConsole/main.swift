//
//  main.swift
//  FundaConsole
//
//  Created by Vladimir Abramichev on 20/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Cocoa
import FundaApiMac
import ApiProviderMac

class _k {}
let bundle = Bundle(for: _k.self)
let builder = FundaRequestBuilder(with: Configuration(bundle: bundle))
let fundaAPI = RemoteApiProvider(with:  builder)

let dispatchGroup = DispatchGroup()


print("Assignmen 1\r")
dispatchGroup.enter()

var makelaarStatistic: [String: Int] = [:]
fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam"))
    .transform { $0.paging.aantalPaginas }
    .transform {
        Reducer(total: $0,
                nextTry: {
                    fundaAPI.request(Endpoint.get(type: .koop, size: 25, page: $0, search: "amsterdam"))
                    .transform { $0.objects ?? [] } },
                onSuccess: {
                    $0.forEach { makelaarStatistic[$0.makelaarNaam] = (makelaarStatistic[$0.makelaarNaam] ?? 0) + 1  }
        })
    }
    .than { $0.start() }
    .observe { result in
        if case .failure(let error) = result {
            print("Error: \(error)")
            return
        }
        
        let top10 = makelaarStatistic.sorted(by: { $0.value > $1.value }).prefix(10)
        
        var position = 1
        top10.forEach {
            print("#\(position) \($0.key) - \($0.value)")
            position += 1
        }
        dispatchGroup.leave()
    }

//// assignment 2
//fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam", "tuin"))
//    .transform { $0.totaalAantalObjecten }
//    .than { fundaAPI.request(Endpoint.get(type: .koop, size: $0, search: "amsterdam", "tuin")) }
//    .transform { $0.objects ?? [] }
//    .transform { Dictionary(grouping: $0) { $0.makelaarNaam } }
//    .transform { $0.sorted(by: { $0.value.count > $1.value.count }) }
//    .transform { $0.prefix(10) }
//    .observe { promis in
//        print("\rAssignmen 2\r")
//        switch promis {
//        case .success(let value):
//            var position = 1
//            value.forEach {
//                print("#\(position) \($0.key) - \($0.value.count)")
//                position += 1
//            }
//            break
//        case .failure(let error):
//            print("Error: \(error)")
//            break
//        }
//}

dispatchGroup.notify(queue: DispatchQueue.main) {
    exit(EXIT_SUCCESS)
}
dispatchMain()
