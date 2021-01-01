//
//  LabRatings.swift
//  Seha Khanah
//
//  Created by Anas on 1/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class LabRatings:  Codable{
    var rate: String?
    var comment: String?
    var  personName:String?
    var data:String?
    
    init?(withJSON data: JSON) {
        
        self.rate = data["rate"].stringValue
        self.comment = data["comment"].stringValue
        self.personName = data["person_name"].stringValue
        self.data = data["data"].stringValue
        
        
    }
}
