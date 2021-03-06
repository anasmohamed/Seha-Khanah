//
//  LabDetails.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class LabDetails: Codable {
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
    var latitude:String?
    var logitude:String?
    var rating: String?
    var dates : LabDate?
    var labDates = [JSON]()
    var datesList = [LabDate]()
    var labPhotos = [String]()
    var ratingsList = [LabRatings]()
    var labServicesList = [LabServices]()
    var labRatings = [JSON]()
    init() {
        
    }
    init?(withJSON data: JSON) {
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
        self.labDates = data["dates"].arrayValue
        self.labRatings = data["ratings"].arrayValue
        self.latitude = data["lat"].stringValue
        self.logitude = data["lng"].stringValue
        let labPhotosList = data["laboratory_photos"].arrayValue
        let labServices = data["laboratory_services"].arrayValue
        for labPhoto in labPhotosList
        {
            self.labPhotos.append(labPhoto["featured"].stringValue)
        }
        for date in labDates
        {
            self.dates = LabDate(withJSON: date)
            if self.dates?.status == "1"{
            self.datesList.append(dates!)
            }
        }
        for labRating in labRatings
        {
            let data = LabRatings(withJSON: labRating)
            self.ratingsList.append(data!)
        }
        for labService in labServices
        {
            let data = LabServices(withJSON: labService)
            self.labServicesList.append(data!)
        }
    }
}
