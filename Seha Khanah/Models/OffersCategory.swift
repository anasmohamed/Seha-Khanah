//
//  OffersCategories.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class OffersCategory:Codable  {
    var photo: String?
    var nameEn: String?
    var nameAr : String?
    init?(withJSON data: JSON) {
        
        self.photo = data["featured"].stringValue
        self.nameEn = data["name_en"].stringValue
        self.nameAr = data["name_ar"].stringValue

        
    }
}
