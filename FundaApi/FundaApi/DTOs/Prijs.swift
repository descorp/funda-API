//
//  Producten.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

public struct Prijs: Codable {
    let geenExtraKosten: Bool
    let huurAbbreviation: String
    let huurprijs: Int?
    let huurprijsOpAanvraag: String
    let huurprijsTot: Int?
    let koopAbbreviation: String
    let koopprijs: Int?
    let koopprijsOpAanvraag: String
    let koopprijsTot: Int?
    let originelePrijs: Int?
    let veilingText: String
    
    enum CodingKeys: String, CodingKey {
        case geenExtraKosten = "GeenExtraKosten"
        case huurAbbreviation = "HuurAbbreviation"
        case huurprijs = "Huurprijs"
        case huurprijsOpAanvraag = "HuurprijsOpAanvraag"
        case huurprijsTot = "HuurprijsTot"
        case koopAbbreviation = "KoopAbbreviation"
        case koopprijs = "Koopprijs"
        case koopprijsOpAanvraag = "KoopprijsOpAanvraag"
        case koopprijsTot = "KoopprijsTot"
        case originelePrijs = "OriginelePrijs"
        case veilingText = "VeilingText"
    }
}
