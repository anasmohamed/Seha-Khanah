//
//  DoctorDates.swift
//  Seha Khanah
//
//  Created by Anas on 1/6/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class DoctorDates: Codable {
    var date: String?
    var dayAr: String?
    var dayEn: String?
    var startTime: String?
    var endTime: String?
    var status : String?
    var timesList = [Time]()
    init?(withJSON data: JSON) {
        self.status = data["status"].stringValue
        self.dayAr = data["day_ar"].stringValue
        self.dayEn = data["day_en"].stringValue
        self.date = data["date"].stringValue
        self.startTime = data["start_time"].stringValue
        self.endTime = data["end_time"].stringValue
        let times = data["times"].arrayValue
        for time in times
        {
            let data = Time(withJSON: time)
            timesList.append(data!)
        }
    }
}
