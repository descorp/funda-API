//
//  Object.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

public struct Object: Codable {
    private let aanmeldDatumRaw, publicatieDatumRaw: String
    private let datumAanvaardingRaw,
    datumOndertekeningAkteRaw,
    gewijzigdDatumRaw,
    transactieAfmeldDatumRaw: String?
    
    let aangebodenSindsTekst: String
    let aantalBeschikbaar: Int?
    let aantalKamers: Int
    let aantalKavels: Int?
    let aanvaarding: Aanvaarding
    let adres: String
    let afstand: Int
    let bronCode: BronCode
    let childrenObjects: [JSONAny]
    let foto, fotoLarge, fotoLargest, fotoMedium: String
    let fotoSecure: String
    let globalID: Int
    let groupByObjectType: String
    let heeft360GradenFoto, heeftBrochure, heeftOpenhuizenTopper, heeftOverbruggingsgrarantie: Bool
    let heeftPlattegrond, heeftTophuis, heeftVeiling, heeftVideo: Bool
    let huurPrijsTot, huurprijs: Int?
    let huurprijsFormaat: String?
    let id: String
    let inUnitsVanaf: JSONNull?
    let indProjectObjectType: Bool
    let indTransactieMakelaarTonen: JSONNull?
    let isSearchable, isVerhuurd, isVerkocht, isVerkochtOfVerhuurd: Bool
    let koopprijs: Int?
    let koopprijsFormaat: String?
    let koopprijsTot: Int?
    let makelaarID: Int
    let makelaarNaam: String
    let mobileURL: String
    let note: JSONNull?
    let openHuis: [String]
    let oppervlakte: Int
    let perceeloppervlakte: Int?
    let postcode: String
    let prijs: Prijs
    let prijsGeformatteerdHTML, prijsGeformatteerdTextHuur, prijsGeformatteerdTextKoop: String
    let producten: [Producten]
    let project: Project
    let projectNaam: JSONNull?
    let promoLabel: PromoLabel
    let publicatieStatus: Int
    let savedDate: JSONNull?
    let soortAanbod: SoortAanbod
    let objectSoortAanbod: Int
    let startOplevering, timeAgoText, transactieMakelaarID: JSONNull?
    let transactieMakelaarNaam: JSONNull?
    let typeProject: Int
    let url: String
    let verkoopStatus: VerkoopStatus
    let wgs84X, wgs84Y: Double
    let woonOppervlakteTot, woonoppervlakte: Int
    let woonplaats: String
    let zoekType: [Int]
    
    var aanmeldDatum: Date {
        return Date()
    }
    
    var publicatieDatum: Date {
        return Date()
    }
    
    var datumAanvaarding: Date? {
        return Date()
    }
    
    var datumOndertekeningAkte: Date? {
        return Date()
    }
    
    var gewijzigdDatum: Date? {
        return Date()
    }
    
    var transactieAfmeldDatum: Date? {
        return Date()
    }
    
    enum CodingKeys: String, CodingKey {
        case aangebodenSindsTekst = "AangebodenSindsTekst"
        case aanmeldDatumRaw = "AanmeldDatum"
        case aantalBeschikbaar = "AantalBeschikbaar"
        case aantalKamers = "AantalKamers"
        case aantalKavels = "AantalKavels"
        case aanvaarding = "Aanvaarding"
        case adres = "Adres"
        case afstand = "Afstand"
        case bronCode = "BronCode"
        case childrenObjects = "ChildrenObjects"
        case datumAanvaardingRaw = "DatumAanvaarding"
        case datumOndertekeningAkteRaw = "DatumOndertekeningAkte"
        case foto = "Foto"
        case fotoLarge = "FotoLarge"
        case fotoLargest = "FotoLargest"
        case fotoMedium = "FotoMedium"
        case fotoSecure = "FotoSecure"
        case gewijzigdDatumRaw = "GewijzigdDatum"
        case globalID = "GlobalId"
        case groupByObjectType = "GroupByObjectType"
        case heeft360GradenFoto = "Heeft360GradenFoto"
        case heeftBrochure = "HeeftBrochure"
        case heeftOpenhuizenTopper = "HeeftOpenhuizenTopper"
        case heeftOverbruggingsgrarantie = "HeeftOverbruggingsgrarantie"
        case heeftPlattegrond = "HeeftPlattegrond"
        case heeftTophuis = "HeeftTophuis"
        case heeftVeiling = "HeeftVeiling"
        case heeftVideo = "HeeftVideo"
        case huurPrijsTot = "HuurPrijsTot"
        case huurprijs = "Huurprijs"
        case huurprijsFormaat = "HuurprijsFormaat"
        case id = "Id"
        case inUnitsVanaf = "InUnitsVanaf"
        case indProjectObjectType = "IndProjectObjectType"
        case indTransactieMakelaarTonen = "IndTransactieMakelaarTonen"
        case isSearchable = "IsSearchable"
        case isVerhuurd = "IsVerhuurd"
        case isVerkocht = "IsVerkocht"
        case isVerkochtOfVerhuurd = "IsVerkochtOfVerhuurd"
        case koopprijs = "Koopprijs"
        case koopprijsFormaat = "KoopprijsFormaat"
        case koopprijsTot = "KoopprijsTot"
        case makelaarID = "MakelaarId"
        case makelaarNaam = "MakelaarNaam"
        case mobileURL = "MobileURL"
        case note = "Note"
        case openHuis = "OpenHuis"
        case oppervlakte = "Oppervlakte"
        case perceeloppervlakte = "Perceeloppervlakte"
        case postcode = "Postcode"
        case prijs = "Prijs"
        case prijsGeformatteerdHTML = "PrijsGeformatteerdHtml"
        case prijsGeformatteerdTextHuur = "PrijsGeformatteerdTextHuur"
        case prijsGeformatteerdTextKoop = "PrijsGeformatteerdTextKoop"
        case producten = "Producten"
        case project = "Project"
        case projectNaam = "ProjectNaam"
        case promoLabel = "PromoLabel"
        case publicatieDatumRaw = "PublicatieDatum"
        case publicatieStatus = "PublicatieStatus"
        case savedDate = "SavedDate"
        case soortAanbod = "Soort-aanbod"
        case objectSoortAanbod = "SoortAanbod"
        case startOplevering = "StartOplevering"
        case timeAgoText = "TimeAgoText"
        case transactieAfmeldDatumRaw = "TransactieAfmeldDatum"
        case transactieMakelaarID = "TransactieMakelaarId"
        case transactieMakelaarNaam = "TransactieMakelaarNaam"
        case typeProject = "TypeProject"
        case url = "URL"
        case verkoopStatus = "VerkoopStatus"
        case wgs84X = "WGS84_X"
        case wgs84Y = "WGS84_Y"
        case woonOppervlakteTot = "WoonOppervlakteTot"
        case woonoppervlakte = "Woonoppervlakte"
        case woonplaats = "Woonplaats"
        case zoekType = "ZoekType"
    }
}

public enum Aanvaarding: String, Codable {
    case beschikbaarPerDirect = "BeschikbaarPerDirect"
    case inOverleg = "InOverleg"
    case beschikbaarPerDatum = "BeschikbaarPer [BeschikbaarheidsDatum]"
}

public enum BronCode: String, Codable {
    case mzv = "MZV"
    case nvm = "NVM"
    case vbo = "VBO"
    case lmv = "LMV"
}

public enum Producten: String, Codable {
    case brochure = "Brochure"
    case featured = "Featured"
    case plattegrond = "Plattegrond"
    case the360Fotos = "360-fotos"
    case toppositie = "Toppositie"
    case video = "Video"
}

public enum SoortAanbod: String, Codable {
    case woonhuis
    case appartement
}

public enum VerkoopStatus: String, Codable {
    case statusBeschikbaar = "StatusBeschikbaar"
}

// MARK: Encode/decode helpers

