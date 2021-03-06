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

print("\r = = = = = \r")
print("Assignmen 1\r")
dispatchGroup.enter()

var makelaarStatistic: [String: Int] = [:]
fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam"))
    .transform { $0.paging.aantalPaginas }
    .transform {
        Reducer(total: $0,
                nextTry: { pageNumber in
                    fundaAPI.request(Endpoint.get(type: .koop, size: 25, page: pageNumber, search: "amsterdam"))
                        .transform { $0.objects ?? [] } },
                onSuccess: {
                    $0.forEach { makelaarStatistic[$0.makelaarNaam] = (makelaarStatistic[$0.makelaarNaam] ?? 0) + 1  }
        })
    }
    .than { $0.start(verbose: false) }
    .observe { result in
        defer { dispatchGroup.leave() }
        
        if case .failure(let error) = result {
            print("Error: \(error)")
            return
        }
        
        var position = 1
        makelaarStatistic.sorted(by: { $0.value > $1.value }).prefix(10).forEach {
            print("#\(position) \($0.key) - \($0.value)")
            position += 1
        }
    }

var quit = false
dispatchGroup.notify(queue: DispatchQueue.main) {
    guard !quit else { exit(EXIT_SUCCESS) }
    quit = true
    
    print("\r = = = = = \r")
    print("Assignmen 2\r")
    dispatchGroup.enter()
    
    makelaarStatistic = [:]
    fundaAPI.request(Endpoint.get(type: .koop, search: "amsterdam", "tuin"))
        .transform { $0.paging.aantalPaginas }
        .transform {
            Reducer(total: $0,
                    nextTry: { pageNumber in
                        fundaAPI.request(Endpoint.get(type: .koop, size: 25, page: pageNumber, search: "amsterdam", "tuin"))
                            .transform { $0.objects ?? [] } },
                    onSuccess: {
                        $0.forEach { makelaarStatistic[$0.makelaarNaam] = (makelaarStatistic[$0.makelaarNaam] ?? 0) + 1  }
            })
        }
        .than { $0.start(verbose: false) }
        .observe { result in
            defer { dispatchGroup.leave() }
            
            if case .failure(let error) = result {
                print("Error: \(error)")
                return
            }

            var position = 1
            makelaarStatistic.sorted(by: { $0.value > $1.value }).prefix(10).forEach {
                print("#\(position) \($0.key) - \($0.value)")
                position += 1
            }
    }
}
dispatchMain()
