//
//  ReservationResponse.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON

class ReservationResponse: Codable {
    var name: String?
    var email: String?
    var phoneNumber:String?
    var bookingDate:String?
    var doctorId:String?
    var statusId : String?
    var labId:String?
    var id : String?
    init() {
        
    }
    init?(withJSON data: JSON) {
        
        self.name = data["name"].stringValue
        self.email = data["email"].stringValue
        self.phoneNumber = data["phonenumber"].stringValue
        self.bookingDate = data["booking_date"].stringValue
        self.doctorId = data["doctor_id"].stringValue
        self.statusId = data["status_id"].stringValue
        self.labId  = data["laboratory_id"].stringValue
        self.id = data["id"].stringValue
        
    }
}
