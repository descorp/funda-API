//
//  Project.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

public struct Project: Codable {
    let aantalKamersTotEnMet, aantalKamersVan, aantalKavels, adres: JSONNull?
    let friendlyURL, gewijzigdDatum, globalID: JSONNull?
    let hoofdFoto: String
    let indIpix, indPDF, indPlattegrond, indTop: Bool
    let indVideo: Bool
    let internalID: String
    let maxWoonoppervlakte, minWoonoppervlakte, naam, omschrijving: JSONNull?
    let openHuizen: [JSONAny]
    let prijs: Prijs?
    let plaats, prijsGeformatteerd, publicatieDatum: JSONNull?
    let type: Int
    let woningtypen: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case aantalKamersTotEnMet = "AantalKamersTotEnMet"
        case aantalKamersVan = "AantalKamersVan"
        case aantalKavels = "AantalKavels"
        case adres = "Adres"
        case friendlyURL = "FriendlyUrl"
        case gewijzigdDatum = "GewijzigdDatum"
        case globalID = "GlobalId"
        case hoofdFoto = "HoofdFoto"
        case indIpix = "IndIpix"
        case indPDF = "IndPDF"
        case indPlattegrond = "IndPlattegrond"
        case indTop = "IndTop"
        case indVideo = "IndVideo"
        case internalID = "InternalId"
        case maxWoonoppervlakte = "MaxWoonoppervlakte"
        case minWoonoppervlakte = "MinWoonoppervlakte"
        case naam = "Naam"
        case omschrijving = "Omschrijving"
        case openHuizen = "OpenHuizen"
        case plaats = "Plaats"
        case prijs = "Prijs"
        case prijsGeformatteerd = "PrijsGeformatteerd"
        case publicatieDatum = "PublicatieDatum"
        case type = "Type"
        case woningtypen = "Woningtypen"
    }
}
