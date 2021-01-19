//
//  OfferDetails.swift
//  Seha Khanah
//
//  Created by Anas on 1/20/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class OfferDetails: Codable {
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
       var ratingsList = [LabRatings]()
       var doctorRatings = [JSON]()
       var vistorNumber: String?
       var waitingTime: String?
       var lat : String?
       var lng : String?
}
