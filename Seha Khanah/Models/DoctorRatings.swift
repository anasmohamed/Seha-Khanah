//
//  DoctorRatings.swift
//  Seha Khanah
//
//  Created by Anas on 1/6/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class DoctorRatings: Codable {
    var rate: String?
    var comment: String?
    var  personName:String?
    var date:String?
    
    init?(withJSON data: JSON) {
        
        self.rate = data["rate"].stringValue
        self.comment = data["comment"].stringValue
        self.personName = data["person_name"].stringValue
        self.date = data["date"].stringValue
        
        
    }
}
