//
//  PharamcyDetailsInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class PharamcyDetailsInteractor{
    func showPharmacyDetails(id: String,
                             completionHandler: @escaping (PharmacyDetails?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.showPharmacyDetails(id:id)).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                let pharmacyOffer = json["data"]
                let data = PharmacyDetails(withJSON: pharmacyOffer)
                
                
                completionHandler(data, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
}
