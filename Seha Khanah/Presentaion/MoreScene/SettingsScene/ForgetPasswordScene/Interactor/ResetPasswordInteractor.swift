//
//  ForgetPasswordsInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class ResetPasswordInteractor {
    func resetPassword(email:String,userType:String,token:String,password:String,passwordConfirmation:String,
                              completionHandler: @escaping (User?, Error?) -> Void) {
           AF.request(SehaKhanahRouter.resetPassword(email:email,userType:userType,token:token,password:password,passwordConfirmation:passwordConfirmation)).validate().responseJSON{
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
               case .success:
                   let json = JSON(response.value)
                   print(json)
                   let jsonUser = json["data"].object
                   print(jsonUser)
                   let user = User(withJSON: JSON(jsonUser))
                   completionHandler(user, nil)
               case .failure(let error):
                   completionHandler(nil, error)
               }
               
           }
           
       }
}
