//
//  MyLabsAppointments.swift
//  Seha Khanah
//
//  Created by Anas on 3/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class MyLabsAppointmentsInteractor {
       func getMyLabsAppointments(
                   completionHandler: @escaping ([MyLabAppointment]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.getUserLabsBookings).validate().responseJSON{
             (response) in
             let result = response.result
             switch result {
             case .success :
                 let json = JSON(response.value)
                 print(json)
                 var myAppointmentsList = [MyLabAppointment]()
                 let myAppointments = json["data"]["booking"].arrayValue
                
                 
                 for myAppointment in myAppointments
                 {
                     let data = MyLabAppointment(withJSON: myAppointment)
                    
                     myAppointmentsList.append(data!)
                    
                 }
                 completionHandler(myAppointmentsList, nil)
             case .failure(let error):
                 completionHandler(nil, error)
             }
             
         }
         
     }
    func cancelBooking(id:String,
                  completionHandler: @escaping (String?, Error?) -> Void) {
       AF.request(SehaKhanahRouter.cancelBooking(id: id)).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                
                let statusMessage = json["success"]
                if statusMessage == true{
                    completionHandler(json["message"].stringValue, nil)

                }else{
                    completionHandler(json["message"].stringValue, nil)

                }
                
              
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
}
