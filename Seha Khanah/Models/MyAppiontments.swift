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
    var id: String?
    var clientId :String?
    var doctorId:String?
    var bookingDate : String?
    var statusId:String?
    var doctor : DoctorDetails?
    var status : BookingStatus?
    init?(withJSON data: JSON) {
        
        self.id = data["id"].stringValue
        self.clientId = data["client_id"].stringValue
        self.doctorId = data["doctor_id"].stringValue
        self.bookingDate = data["booking_date"].stringValue
        self.statusId = data["name_en"].stringValue
        self.doctor = DoctorDetails(withJSON: data["doctor"])
        self.status = BookingStatus(withJSON: data["status"])
        
    }
}
class BookingStatus: Codable {
    var id: String?
    var nameAr:String?
    var nameEn:String?
    init?(withJSON data: JSON) {
        
        self.id = data["id"].stringValue
        self.nameAr = data["name_ar"].string
        self.nameEn = data["name_en"].stringValue
        
    }
}
