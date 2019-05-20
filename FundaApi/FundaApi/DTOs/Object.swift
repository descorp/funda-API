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
    private let datumAanvaardingRaw, datumOndertekeningAkteRaw, gewijzigdDatumRaw, transactieAfmeldDatumRaw: String?
    
    public let aangebodenSindsTekst: String
    public let aantalBeschikbaar: Int?
    public let aantalKamers: Int
    public let aantalKavels: Int?
    public let aanvaarding: Aanvaarding
    public let adres: String
    public let afstand: Int
    public let bronCode: BronCode
    public let childrenObjects: [JSONAny]
    public let foto, fotoLarge, fotoLargest, fotoMedium: String
    public let fotoSecure: String
    public let globalID: Int
    public let groupByObjectType: String
    public let heeft360GradenFoto, heeftBrochure, heeftOpenhuizenTopper, heeftOverbruggingsgrarantie: Bool
    public let heeftPlattegrond, heeftTophuis, heeftVeiling, heeftVideo: Bool
    public let huurPrijsTot, huurprijs: Int?
    public let huurprijsFormaat: String?
    public let id: String
    public let inUnitsVanaf: JSONNull?
    public let indProjectObjectType: Bool
    public let indTransactieMakelaarTonen: JSONNull?
    public let isSearchable, isVerhuurd, isVerkocht, isVerkochtOfVerhuurd: Bool
    public let koopprijs: Int?
    public let koopprijsFormaat: String?
    public let koopprijsTot: Int?
    public let makelaarID: Int
    public let makelaarNaam: String
    public let mobileURL: String
    public let note: JSONNull?
    public let openHuis: [String]
    public let oppervlakte: Int
    public let perceeloppervlakte: Int?
    public let postcode: String
    public let prijs: Prijs
    public let prijsGeformatteerdHTML, prijsGeformatteerdTextHuur, prijsGeformatteerdTextKoop: String
    public let producten: [Producten]
    public let project: Project
    public let projectNaam: JSONNull?
    public let promoLabel: PromoLabel
    public let publicatieStatus: Int
    public let savedDate: JSONNull?
    public let soortAanbod: SoortAanbod
    public let objectSoortAanbod: Int
    public let startOplevering, timeAgoText, transactieMakelaarID: JSONNull?
    public let transactieMakelaarNaam: JSONNull?
    public let typeProject: Int
    public let url: String
    public let verkoopStatus: VerkoopStatus
    public let wgs84X, wgs84Y: Double
    public let woonOppervlakteTot, woonoppervlakte: Int
    public let woonplaats: String
    public let zoekType: [Int]
    
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

