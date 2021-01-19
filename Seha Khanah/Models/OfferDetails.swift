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
    var deviceNameAr: String?
    var deviceNameEn: String?
    var titleNameAr: String?
    var titleNameEn: String?
    var descriptionEn: String?
    var descriptionAr: String?
    var discount:String?
    var dateFrom : String?
    var dateTo:String?
    var doctor: DoctorDetails?
    var bookingNumber : String?
    var ratingsList = [LabRatings]()
    var rating: String?
    var priceDiscount:String?
    var priceAfterDiscount:String?
    var imagesList = [String]()
    var datesList = [LabDate]()
    var labDates = [JSON]()
    var labPhotos = [String]()
    var labServicesList = [LabServices]()
    var labRatings = [JSON]()
    init() {
        
    }
    init?(withJSON data: JSON) {
        
        self.photo = data["featured"].stringValue
        self.id = data["id"].stringValue
        self.price = data["price"].stringValue
        self.discount = data["discount"].stringValue
        self.dateFrom = data["date_from"].stringValue
        self.dateTo = data["date_to"].stringValue
        self.doctor = DoctorDetails(withJSON: data["doctor"])
        let images = data["images"].arrayValue
        let ratings = data["ratings"].arrayValue
        for image in images
        {
            
            self.imagesList.append(image["featured"].stringValue)
        }
        for date in labDates
        {
            let data = LabDate(withJSON: date)
            self.datesList.append(data!)
        }
        for rating in ratings
        {
            let data = LabRatings(withJSON: rating)
            self.ratingsList.append(data!)
        }
    }
    
}
