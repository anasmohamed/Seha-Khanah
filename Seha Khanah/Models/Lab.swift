//
//  Lab.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class Lab: Codable {
    var id : String?
    var photo: String?
    var labNameEn: String?
    var labNameAr: String?
    var price: String?
    var pharmacyPhoto: String?
    var doctorFirstNameEn: String?
    var doctorLastNameEn: String?
    var doctorFirstNameAr: String?
    var doctorLastNameAr: String?
    var aboutAr: String?
    var aboutEn: String?
    var addressEn: String?
    var addressAr: String?
    var rating: String?
    var labPhotosJson : [JSON]!
    var labPhotos : [String]?
    init?(withJSON data: JSON) {
        self.id = data["id"].stringValue
        self.photo = data["featured"].stringValue
        self.labNameEn = data["laboratory_name_en"].stringValue
        self.labNameAr = data["laboratory_name_ar"].stringValue
        self.pharmacyPhoto = data["pharmacy"]["featured"].stringValue
        self.doctorFirstNameEn = data["firstName_en"].stringValue
        self.doctorLastNameEn = data["lastName_en"].stringValue
        self.doctorFirstNameAr = data["firstName_ar"].stringValue
        self.doctorLastNameAr = data["lastName_ar"].stringValue
        self.addressEn = data["address_en"].stringValue
        self.addressAr = data["address_ar"].stringValue
        self.rating = data["rating"].stringValue
        self.labPhotosJson = data["laboratory_photos"].arrayValue
        
        for index in 0..<labPhotosJson.count
        {
            self.labPhotos?.append(labPhotosJson[index]["featured"].stringValue)
        }

    }
}
