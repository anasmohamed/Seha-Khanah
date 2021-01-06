//
//  DoctorDetails.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class DoctorDetails: Codable {
    var photo: String?
    var id : String?
    var price: String?
    var doctorFirstNameEn: String?
    var doctorLastNameEn: String?
    var doctorFirstNameAr: String?
    var doctorLastNameAr: String?
    var specialityId: String?
    var prefixTitleId: String?
    var profissionalDetailsId:String?
    var profissionalTitleEn : String?
    var profissionalTitleAr:String?
    var addressEn: String?
    var addressAr: String?
    var rating: String?
    var genderId:String?
    var aboutDoctorAr: String?
    var aboutDoctorEn:String?
    var prefixTitleAr: String?
    var prefixTitleEn: String?
    var ratingsList = [DoctorRatings]()
    var doctorRatings = [JSON]()
    var vistorNumber: String?
    var waitingTime: String?
    init() {
        
    }
    init?(withJSON data: JSON) {
        self.photo = data["featured"].stringValue
        self.price = data["price"].stringValue
        self.id = data["id"].stringValue
        self.specialityId = data["specialty_id"].stringValue
        self.prefixTitleId = data["prefix_title_id"].stringValue
        self.profissionalDetailsId = data["profissionalDetails_id"].stringValue
        self.profissionalTitleEn = data["profissionalTitle_en"].stringValue
        self.profissionalTitleAr = data["profissionalTitle_ar"].stringValue
        self.genderId  = data["gender_id"].stringValue
        self.aboutDoctorAr = data["aboutDoctor_ar"].stringValue
        self.aboutDoctorEn = data["aboutDoctor_en"].stringValue
        self.doctorFirstNameEn = data["firstName_en"].stringValue
        self.doctorLastNameEn = data["lastName_en"].stringValue
        self.doctorFirstNameAr = data["firstName_ar"].stringValue
        self.doctorLastNameAr = data["lastName_ar"].stringValue
        self.addressEn = data["address_en"].stringValue
        self.addressAr = data["address_ar"].stringValue
        self.rating = data["rating"].stringValue
        self.prefixTitleAr = data["prefix_title"]["name_ar"].stringValue
        self.prefixTitleEn = data["prefix_title"]["name_en"].stringValue
        self.vistorNumber = data["visitor_num"].stringValue
        self.waitingTime = data["waiting_time"].stringValue
        for doctorRating in doctorRatings
        {
            let data = DoctorRatings(withJSON: doctorRating)
            self.ratingsList.append(data!)
        }
    }
}
