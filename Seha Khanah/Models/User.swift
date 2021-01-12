//
//  User.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class User: Codable {
    var id: String?
    var phoneNumber: String?
    var email: String?
    var genderId:String?
    var name : String?
    var birthday:String?
    var token:String?
    init() {
        
    }
    init?(withJSON data: JSON) {
        self.id = data["user"]["id"].stringValue
        self.phoneNumber = data["user"]["phonenumber"].stringValue
        self.email = data["user"]["email"].stringValue
        self.genderId = data["user"]["gender_id"].stringValue
        self.name = data["user"]["name"].stringValue
        self.email = data["user"]["email"].stringValue
        self.birthday = data["user"]["birthday"].stringValue
        self.token = data["token"].stringValue

        
    }
}
class Message: Codable {
       var phoneNumber: String?
       var email: String?
       var genderId:String?
       var name : String?
       var birthday:String?
       init() {
           
       }
       init?(withJSON data: JSON) {
        self.phoneNumber = data["phonenumber"][0].stringValue
           self.email = data["email"][0].stringValue
           self.name = data["name"][0].stringValue
           self.email = data["email"][0].stringValue
           self.birthday = data["birthday"][0].stringValue

           
       }
}
