//
//  PharmacyDetails.swift
//  Seha Khanah
//
//  Created by Anas on 1/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class PharmacyDetails: Codable {
    var photo: String?
    var titleEn: String?
    var titleAr: String?
    var price: String?
    var pharmacyPhoto: String?
    var doctorFirstNameEn: String?
    var doctorLastNameEn: String?
    var doctorFirstNameAr: String?
    var doctorLastNameAr: String?
    var pharmacyNameAr: String?
    var pharamcyNameEn: String?
    var aboutAr: String?
    var aboutEn: String?
    var addressAr:String?
    var addressEn:String?
    var lat : String?
    var lng:String?
    
    init(){
        
    }
    init?(withJSON data: JSON) {
        self.photo = data["featured"].stringValue
        self.titleEn = data["title_en"].stringValue
        self.titleAr = data["title_ar"].stringValue
        self.price = data["price"].stringValue
        self.pharmacyPhoto = data["pharmacy"]["featured"].stringValue
        self.doctorFirstNameEn = data["pharmacy"]["firstName_en"].stringValue
        self.doctorLastNameEn = data["pharmacy"]["lastName_en"].stringValue
        self.doctorFirstNameAr = data["pharmacy"]["firstName_ar"].stringValue
        self.doctorLastNameAr = data["pharmacy"]["lastName_ar"].stringValue
        self.pharmacyNameAr = data["pharmacy"]["pharmacy_name_ar"].stringValue
        self.pharamcyNameEn = data["pharmacy"]["pharmacy_name_en"].stringValue
        self.aboutAr = data["pharmacy"]["about_ar"].stringValue
        self.aboutEn = data["pharmacy"]["about_en"].stringValue
        self.addressAr = data["pharmacy"]["address_ar"].stringValue
        self.addressEn = data["pharmacy"]["address_en"].stringValue
        self.lat = data["pharmacy"]["lat"].stringValue
        self.lng = data["pharmacy"]["lng"].stringValue

        
    }
}
