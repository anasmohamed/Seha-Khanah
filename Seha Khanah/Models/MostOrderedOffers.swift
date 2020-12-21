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
    var price :String?
    var discount:String?
    var coverImage: String?
    var doctorFristNameEn: String?
    var doctorLastNameEn:String?
    var rating: String?
    init?(withJSON data: JSON) {
        
        self.doctorPhoto = data["doctor"]["featured"].stringValue
        self.doctorFristNameEn = data["doctor"]["firstName_en"].stringValue
        self.doctorLastNameEn = data["doctor"]["lastName_en"].stringValue
        self.titleEn = data["title_en"].stringValue
        self.price = data["price"].stringValue
        self.discount = data["discount"].stringValue
        self.coverImage = data["images"][0]["featured"].stringValue
        self.rating = data["rating"].stringValue
        print(coverImage)
    }
}
