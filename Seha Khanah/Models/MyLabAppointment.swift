//
//  MyLabAppointment.swift
//  Seha Khanah
//
//  Created by Anas on 3/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class MyLabAppointment: Codable {
    var id : String?
    var clientId : String?
    var doctorId: String?
    var bookingDate : String?
    var statusId : String?
    var lab : LabDetails?
    var status : BookingStatus?
    init?(withJSON data: JSON) {
        
        self.id = data["id"].stringValue
        self.clientId = data["client_id"].stringValue
        self.doctorId = data["doctor_id"].stringValue
        self.bookingDate = data["booking_date"].stringValue
        self.statusId = data["status_id"].stringValue
        self.lab = LabDetails(withJSON: data["laboratory"])
        self.status = BookingStatus(withJSON: data["status"])
        
    }
}
class LabBookingStatus: Codable {
    var id: String?
    var nameAr:String?
    var nameEn:String?
    init?(withJSON data: JSON) {
        
        self.id = data["id"].stringValue
        self.nameAr = data["name_ar"].string
        self.nameEn = data["name_en"].stringValue
        
    }
}
