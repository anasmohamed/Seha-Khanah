//
//  SubCategory.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class SubCategory:Codable {
    var id : String?
    var nameEn: String?
    var nameAr: String?
    init?(withJSON data: JSON) {
        self.id = data["id"].stringValue
        self.nameAr = data["name_ar"].stringValue
        self.nameEn = data["name_en"].stringValue
    }
    
    
}
