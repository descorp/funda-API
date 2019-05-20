//
//  FundaRequestBuilder.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 19/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider

public class FundaRequestBuilder: RequestBuilder {
    
    private let config : Configuration
    
    public init(with configuration: Configuration) {
        self.config = configuration
    }
    
    public func buildRequest<T>(for endpoint: Endpoint<T>) -> URLRequest? {
        guard var components = URLComponents(string: config.url)
            else { preconditionFailure("invalud URL in config file") }
        
        components.appendPath(config.appKey)
        components.appendPath(endpoint.path)
        components.queryItems = endpoint.queryItems
        
        guard let url = components.url
            else { preconditionFailure("invalud URL: \(components.description)") }
        
        return URLRequest(url: url)
    }
}

extension URLComponents {
    mutating func appendPath(_ component: String?) {
        guard let component = component else { return }
        appendPath(component.hasPrefix("/") ? "\(component.dropFirst())" : component)
    }
    
    mutating func appendPath(_ component: Int?) {
        guard let component = component else { return }
        appendPath("\(component)")
    }
    
    private mutating func appendPath(_ component: String) {
        self.path += "/" + component
    }
}

