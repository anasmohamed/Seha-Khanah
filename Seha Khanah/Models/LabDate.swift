//
//  LabDate.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class LabDate: Codable {
    var date: String?
    var dayAr: String?
    var dayEn: String?
    var startTime: String?
    var endTime: String?
    init?(withJSON data: JSON) {
        
        self.dayAr = data["day_ar"].stringValue
        self.dayEn = data["day_en"].stringValue
        self.date = data["date"].stringValue
        self.startTime = data["start_time"].stringValue
        self.endTime = data["end_time"].stringValue
    }
}
