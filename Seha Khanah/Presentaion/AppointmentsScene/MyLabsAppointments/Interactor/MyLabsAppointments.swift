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
    func cancelLabBooking(id:String,
                  completionHandler: @escaping (String?, Error?) -> Void) {
       AF.request(SehaKhanahRouter.cancelLabBooking(id: id)).validate().responseJSON{
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
