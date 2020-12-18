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
    init?(withJSON data: JSON) {
    
        self.photo = data["photos"][0].stringValue
       
    }
}
