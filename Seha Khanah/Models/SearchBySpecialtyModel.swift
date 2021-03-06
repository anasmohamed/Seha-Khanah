//
//  SearchBySpecialtyModel.swift
//  Seha Khanah
//
//  Created by Anas on 12/23/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class SearchBySpecialtyModel :Codable{
    var photo: String?
    var nameEn: String?
    var nameAr : String?
    var id : String?
    init?(withJSON data: JSON) {
        self.id = data["id"].stringValue
        self.photo = data["icon"].stringValue
        self.nameEn = data["name_en"].stringValue
        self.nameAr = data["name_ar"].stringValue
        
    }
}
