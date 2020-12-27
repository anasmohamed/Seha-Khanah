//
//  AboutApp.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class AboutApp: Codable {
    var aboutAppAr: String?
    var aboutAppEn: String?
    init?(withJSON data: JSON) {
        
        self.aboutAppAr = data["aboutUs_ar"].stringValue
        self.aboutAppEn = data["aboutUs_en"].stringValue
        
    }
}
