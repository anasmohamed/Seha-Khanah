//
//  PharmacyOffersInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class PharmacyOffersInateractor {
    func getPharmacyOffers(
                     completionHandler: @escaping ([PharmacyOffer]?, Error?) -> Void) {
           AF.request(SehaKhanahRouter.getAllPharmacyOffers).validate().responseJSON{
               (response) in
               let result = response.result
               switch result {
               case .success :
                   let json = JSON(response.value)
                   print(json)
                   var pharmacyOfferList = [PharmacyOffer]()
                   let pharmacyOffers = json["data"].arrayValue
                  
                   
                   for pharmacyOffer in pharmacyOffers
                   {
                       let data = PharmacyOffer(withJSON: pharmacyOffer)
                       pharmacyOfferList.append(data!)
                       
                   }
                   completionHandler(pharmacyOfferList, nil)
               case .failure(let error):
                   completionHandler(nil, error)
               }
               
           }
           
       }
}
