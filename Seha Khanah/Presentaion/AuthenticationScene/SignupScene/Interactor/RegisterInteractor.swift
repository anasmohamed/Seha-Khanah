//
//  RegisterInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/10/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class RegisterInteractor {
    func register(email: String,
                  password: String,name:String,phoneNumber:String,genderId:Int,birthday:Date,
                  completionHandler: @escaping (User?,Message?, Error?) -> Void) {
        
        AF.request(SehaKhanahRouter.register(email: email, password: password, name: name, phonenumber: phoneNumber, genderId: genderId, birthday: birthday)).responseJSON {
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
                if json["success"] == true{
                    let jsonUser = json["data"].object
                    print(jsonUser)
                    let user = User(withJSON: JSON(jsonUser))
                    completionHandler(user,nil, nil)
                }else{
                    let messageJson = json["message"]
                    let message = Message(withJSON: messageJson)

                    completionHandler(nil,message, nil)
                }
            case .failure(let error):
                completionHandler(nil,nil, error)
            }
        }
    }
}
