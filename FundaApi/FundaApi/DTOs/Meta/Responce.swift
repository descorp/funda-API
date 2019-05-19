// To parse the JSON, add this file to your project and do:
//
//   let funda = try? newJSONDecoder().decode(Funda.self, from: jsonData)

import Foundation

public struct Response<T: Codable> : Codable {
    let accountStatus: Int
    let emailNotConfirmed, validationFailed: Bool
    let validationReport: JSONNull?
    let website: Int
    let metadata: Metadata
    let objects: [T]?
    let paging: Paging
    let totaalAantalObjecten: Int
    
    enum CodingKeys: String, CodingKey {
        case accountStatus = "AccountStatus"
        case emailNotConfirmed = "EmailNotConfirmed"
        case validationFailed = "ValidationFailed"
        case validationReport = "ValidationReport"
        case website = "Website"
        case metadata = "Metadata"
        case objects = "Objects"
        case paging = "Paging"
        case totaalAantalObjecten = "TotaalAantalObjecten"
    }
}
