// To parse the JSON, add this file to your project and do:
//
//   let funda = try? newJSONDecoder().decode(Funda.self, from: jsonData)

import Foundation

public struct Response<T: Codable> : Codable {
    public let accountStatus: Int
    public let emailNotConfirmed, validationFailed: Bool
    public let validationReport: JSONNull?
    public let website: Int
    public let metadata: Metadata
    public let objects: [T]?
    public let paging: Paging
    public let totaalAantalObjecten: Int
    
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
