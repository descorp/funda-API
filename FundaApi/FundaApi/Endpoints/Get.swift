//
//  Search.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider

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
            let preparedSearch = search.map { $0.hasPrefix("/") ? $0 : "/\($0)" }
            queries.append(URLQueryItem(name: "zo", value: preparedSearch.joined(separator: "/") ))
        }
        
        if let size = size {
            queries.append(URLQueryItem(name: "size", value: String(size)))
        }
        
        return Endpoint(path: "/",
                        queryItems: queries,
                        parse: T.decode)
    }
}
