//
//  Paging.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

public struct Paging: Codable {
    public let aantalPaginas, huidigePagina: Int
    public let volgendeURL: String?
    public let vorigeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case aantalPaginas = "AantalPaginas"
        case huidigePagina = "HuidigePagina"
        case volgendeURL = "VolgendeUrl"
        case vorigeURL = "VorigeUrl"
    }
}
