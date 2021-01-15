//
//  MostOrderedOffersImage.swift
//  Seha Khanah
//
//  Created by Anas on 1/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class MostOrderedOffersImage: Codable {
    var id :String?
    var imageEn:String?
    var imageAr:String?

    init(withJson data:JSON) {
        self.id = data["id"].stringValue
        self.imageEn = data["featured_en"].stringValue
        self.imageAr = data["featured_ar"].stringValue

    }
}
