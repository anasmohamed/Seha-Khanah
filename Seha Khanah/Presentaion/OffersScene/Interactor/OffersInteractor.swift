//
//  OffersInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class OffersInteractor {
    
    
    func getOffersCategoris(
        completionHandler: @escaping ([OffersCategory]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.getOffersCategories).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                //                print(result)
                var offersCategoriesList = [OffersCategory]()
                let offersCategories = json["data"].arrayValue
                
                for offer in offersCategories
                {
                    let data = OffersCategory(withJSON: offer)
                    offersCategoriesList.append(data!)
                    
                }
                completionHandler(offersCategoriesList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }}
    
    func getMostOrderedOffers(
           completionHandler: @escaping ([MostOrderedOffers]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.getMostOrderedOffers).validate().responseJSON{
               (response) in
            
            
                       if let response = response.data {
                           print("Response Data: \(response)")
                       } else {
                           print("Response Data: nil")
                       }
                       if let request = response.request {
                           print("Request Request: \(request)")
                           print("Request Description: \(request.description)")
                           print("Request Debug Description: \(request.debugDescription)")
                           
                           print("Response Request HTTP method: \(request.httpMethod!)")
                           //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
                       } else {
                           print("Response Request: nil")
                       }
                       
                       if let responseStatusCode = response.response {
                           print("Response Status Code: \(responseStatusCode.statusCode)")
                       } else {
                           print("Response Status Code: nil")
                       }
                       
                       if let error = response.error {
                           print("Response Error Code: \(error.localizedDescription)")
                       } else {
                           print("Response Error Code: nil")
                       }
                       
               let result = response.result
               switch result {
               case .success :
                   let json = JSON(response.value)
                   print(json)
                   var mostOrderedOffersList = [MostOrderedOffers]()
                   let mostOrderedOffers = json["data"].arrayValue
                   
                   for mostOrderedOffer in mostOrderedOffers
                   {
                       let data = MostOrderedOffers(withJSON: mostOrderedOffer)
                       mostOrderedOffersList.append(data!)
                       
                   }
                   completionHandler(mostOrderedOffersList, nil)
               case .failure(let error):
                   completionHandler(nil, error)
               }
               
           }}
    
}
