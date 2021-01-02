//
//  LabServices.swift
//  Seha Khanah
//
//  Created by Anas on 1/2/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class LabServices: Codable {
    var nameAr: String?
    var nameEn: String?
    init?(withJSON data: JSON) {
        
        self.nameAr = data["name_ar"].stringValue
        self.nameEn = data["name_en"].stringValue
        
    }
}
