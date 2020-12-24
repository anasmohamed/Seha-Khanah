//
//  Area.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class Area: Codable {
    var areaNameEn: String?
    var areaNameAr: String?
    init?(withJSON data: JSON) {
        self.areaNameEn = data["area_en"].stringValue
        self.areaNameAr = data["area_ar"].stringValue
        
    }
}
