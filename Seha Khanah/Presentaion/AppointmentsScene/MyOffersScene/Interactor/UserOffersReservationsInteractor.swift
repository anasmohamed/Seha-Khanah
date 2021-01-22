//
//  UserOffersReservationsInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/23/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class UserOffersReservationsInteractor {
    func getMyOffers(
        completionHandler: @escaping ([MyAppiontments]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.userOffersReservations).validate().responseJSON{
            (response) in
            let result = response.result
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
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                var myAppointmentsList = [MyAppiontments]()
                let myAppointments = json["data"]["booking"].arrayValue
                
                
                for myAppointment in myAppointments
                {
                    let data = MyAppiontments(withJSON: myAppointment)
                    //                    if data?.statusId == "3"{
                    myAppointmentsList.append(data!)
                    //                    }
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
