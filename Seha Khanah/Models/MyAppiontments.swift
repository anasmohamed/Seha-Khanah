//
//  MyAppiontments.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class MyAppiontments: Codable {
    var photo: String?
     var nameEn: String?
     init?(withJSON data: JSON) {
         
         self.photo = data["featured"].stringValue
         self.nameEn = data["name_en"].stringValue
         
     }
}
