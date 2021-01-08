//
//  MyAppointmentsInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class MyAppointmentsInteractor {
       func getAllLabs(
                   completionHandler: @escaping ([Lab]?, Error?) -> Void) {
         AF.request(SehaKhanahRouter.getAllLabs).validate().responseJSON{
             (response) in
             let result = response.result
             switch result {
             case .success :
                 let json = JSON(response.value)
                 print(json)
                 var labList = [Lab]()
                 let labs = json["data"]["search"].arrayValue
                
                 
                 for lab in labs
                 {
                     let data = Lab(withJSON: lab)
                     labList.append(data!)
                     
                 }
                 completionHandler(labList, nil)
             case .failure(let error):
                 completionHandler(nil, error)
             }
             
         }
         
     }
}
