//
//  PromoLabel.swift
//  FundaApi
//
//  Created by Vladimir Abramichev on 18/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

public struct PromoLabel: Codable {
    let hasPromotionLabel: Bool
    let promotionPhotos: [String]
    let promotionPhotosSecure: [String]?
    let promotionType, ribbonColor: Int
    let ribbonText: JSONNull?
    let tagline: String?
    
    enum CodingKeys: String, CodingKey {
        case hasPromotionLabel = "HasPromotionLabel"
        case promotionPhotos = "PromotionPhotos"
        case promotionPhotosSecure = "PromotionPhotosSecure"
        case promotionType = "PromotionType"
        case ribbonColor = "RibbonColor"
        case ribbonText = "RibbonText"
        case tagline = "Tagline"
    }
}
