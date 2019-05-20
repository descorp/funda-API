//
//  Search.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
#if os(OSX)
import ApiProviderMac
#elseif os(iOS)
import ApiProvider
#endif

public enum ObjectType: String {
    case koop
    case huur
    case nieuwbouw
    case makelaars
}

public extension Endpoint where T == Response<Object> {
    static func get(type: ObjectType, size: Int? = nil, page: Int? = nil, search: String...) -> Endpoint {
        var queries = [URLQueryItem]()
        queries.append(URLQueryItem(name: "type", value: type.rawValue))
        
        if !search.isEmpty {
            let preparedSearch = search.map { $0.trimmingCharacters(in: CharacterSet(arrayLiteral: "/")) }
            queries.append(URLQueryItem(name: "zo", value: "/" + preparedSearch.joined(separator: "/") ))
        }
        
        if let size = size {
            queries.append(URLQueryItem(name: "pagesize", value: String(size)))
        }
        
        if let page = page {
            queries.append(URLQueryItem(name: "page", value: String(page)))
        }
        
        return Endpoint(path: "/",
                        queryItems: queries,
                        parse: T.decode)
    }
}
