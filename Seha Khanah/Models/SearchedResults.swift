//
//  SearchedResults.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class SearchedResults:Codable {
    var photo: String?
    var nameEn: String?
    var firstNameEn:String?
    var lastNameEn:String?
    var firstNameAr:String?
    var lastNameAr:String?
    var profissionalTitleEn:String?
    var profissionalTitleAr:String?
    var aboutDoctorEn :String?
    var aboutDoctorAr:String?
    var price : String?
    var waitingTime:String?
    var numberOfVisitor:String?
    var rating:String?
    var id: String?
    init?(withJSON data: JSON) {
        self.id = data["id"].stringValue
        self.photo = data["featured"].stringValue
        self.firstNameAr = data["firstName_ar"].stringValue
        self.lastNameAr = data["lastName_ar"].stringValue
        self.firstNameEn = data["firstName_en"].stringValue
        self.lastNameEn = data["lastName_en"].stringValue
        self.profissionalTitleAr = data["profissionalTitle_ar"].stringValue
        self.profissionalTitleEn = data["profissionalTitle_en"].stringValue
        self.aboutDoctorEn = data["aboutDoctor_en"].stringValue
        self.aboutDoctorAr = data["aboutDoctor_ar"].stringValue
        self.price = data["price"].stringValue
        self.waitingTime = data["waiting_time"].stringValue
        self.numberOfVisitor = data["visitor_num"].stringValue
        self.rating = data["rating"].stringValue
        
        
    }
}
