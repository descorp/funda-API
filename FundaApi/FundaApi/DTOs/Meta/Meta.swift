//
//  Meta.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 16/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

struct Metadata: Codable {
    let objectType, omschrijving, titel: String
    
    enum CodingKeys: String, CodingKey {
        case objectType = "ObjectType"
        case omschrijving = "Omschrijving"
        case titel = "Titel"
    }
}
