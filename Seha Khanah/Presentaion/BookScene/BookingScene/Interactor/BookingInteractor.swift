//
//  BookingInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class BookingInteractor {
    func labBooking(name : String,email:String,phoneNumber:String,bookingDate : String,labId:String,checkbox:String,
                    completionHandler: @escaping (ReservationResponse?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.labReservation(name: name, email: email, phonenumber: phoneNumber, bookingDate: bookingDate, labId: labId, checkbox: checkbox)).validate().responseJSON{
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
                let bookingResponse = json["data"]["booking"]
                let bookResult = ReservationResponse(withJSON: bookingResponse)
                
                completionHandler(bookResult, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }}
    func doctorBooking(name : String,email:String,phoneNumber:String,bookingDate : String,labId:String,checkbox:String,
                       completionHandler: @escaping (ReservationResponse?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.doctorReservation(name: name, email: email, phonenumber: phoneNumber, bookingDate: bookingDate, doctorId: labId, checkbox: checkbox)).validate().responseJSON{
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
                   let bookingResponse = json["data"]["booking"]
                   let bookResult = ReservationResponse(withJSON: bookingResponse)
                   
                   completionHandler(bookResult, nil)
               case .failure(let error):
                   completionHandler(nil, error)
               }
               
           }}
}
