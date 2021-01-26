//
//  MostOrderedOffers.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class MostOrderedOffers {
    var doctorPhoto: String?
    var titleEn: String?
    var titleAr:String?
    var price :String?
    var discount:String?
    var coverImage: String?
    var doctorFristNameEn: String?
    var doctorLastNameEn:String?
    var doctorFristNameAr: String?
    var doctorLastNameAr:String?
    var deviceNameAr:String?
    var deviceNameEn:String?
    var rating: String?
    var addressAr:String?
    var addressEn:String?
    var id :String?
    var totalAddressAr: String?
    var totalAddressEn : String?
    var imagesList : [MostOrderedOffersImage]?
    init?(withJSON data: JSON) {
        self.id = data["id"].stringValue
        self.doctorPhoto = data["doctor"]["featured"].stringValue
        self.doctorFristNameEn = data["doctor"]["firstName_en"].stringValue
        self.doctorLastNameEn = data["doctor"]["lastName_en"].stringValue
        self.titleEn = data["title_en"].stringValue
        self.titleAr = data["title_ar"].stringValue
        self.doctorFristNameAr = data["doctor"]["firstName_ar"].stringValue
        self.doctorLastNameAr = data["doctor"]["lastName_ar"].stringValue
        self.deviceNameAr = data["device_name_ar"].stringValue
        self.deviceNameEn = data["device_name_en"].stringValue
        self.price = data["price"].stringValue
        self.discount = data["discount"].stringValue
        self.coverImage = data["images"][0]["featured"].stringValue
        self.rating = data["rating"].stringValue
        self.addressAr = data["doctor"]["address_ar"].stringValue
        self.addressEn = data["doctor"]["address_en"].stringValue
        self.totalAddressAr = data["doctor"]["total_address_ar"].stringValue
        self.totalAddressEn = data["doctor"]["total_address_en"].stringValue

        //        let images = data["images"].arrayValue
        //        for image in images{
        //            let data = MostOrderedOffersImage(withJson: image)
        //            imagesList?.append(data)
        //        }
        print(coverImage)
    }
}
