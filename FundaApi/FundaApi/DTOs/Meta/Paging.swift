//
//  Paging.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

struct Paging: Codable {
    let aantalPaginas, huidigePagina: Int
    let volgendeURL: String
    let vorigeURL: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case aantalPaginas = "AantalPaginas"
        case huidigePagina = "HuidigePagina"
        case volgendeURL = "VolgendeUrl"
        case vorigeURL = "VorigeUrl"
    }
}
