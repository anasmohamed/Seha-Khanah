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
       func getMyAppointments(
                   completionHandler: @escaping ([MyAppiontments]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.booking).validate().responseJSON{
             (response) in
             let result = response.result
             switch result {
             case .success :
                 let json = JSON(response.value)
                 print(json)
                 var myAppointmentsList = [MyAppiontments]()
                 let myAppointments = json["data"]["booking"].arrayValue
                
                 
                 for myAppointment in myAppointments
                 {
                     let data = MyAppiontments(withJSON: myAppointment)
                     myAppointmentsList.append(data!)
                     
                 }
                 completionHandler(myAppointmentsList, nil)
             case .failure(let error):
                 completionHandler(nil, error)
             }
             
         }
         
     }
}
