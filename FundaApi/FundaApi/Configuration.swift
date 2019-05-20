//
//  EnvironmentConfiguration.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 19/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
#if os(OSX)
import ApiProviderMac
#elseif os(iOS)
import ApiProvider
#endif

extension Configuration {
    var appKey: String {
        set { config["AppKey"] = newValue }
        get { return config["AppKey"] as! String }
    }
    
    var url: String {
        set { config["Url"] = newValue }
        get { return config["Url"] as! String }
    }
}
