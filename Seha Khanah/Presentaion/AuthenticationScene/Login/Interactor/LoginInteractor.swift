//
//  LoginInteracotor.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class LoginInteractor {
    func login(email: String,
               password: String,
               completionHandler: @escaping (User?,String?, Error?) -> Void) {
        
        AF.request(SehaKhanahRouter.login(email: email, passsword: password)).responseJSON {
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

                if json["success"] == true{
                    let jsonUser = json["data"].object
                    print(jsonUser)
                    let user = User(withJSON: JSON(jsonUser))
                    completionHandler(user,nil, nil)
                }else{
                    let message = json["message"].stringValue
                    
                    completionHandler(nil,message, nil)
                }
            case .failure(let error):
                completionHandler(nil, nil,error)
            }
        }
    }
    func getUserToken(grantType: String,clientId:String,clientSecret:String,scope:String,
                      completionHandler: @escaping (String?, Error?) -> Void) {
        
        AF.request(SehaKhanahRouter.getUserToken(grantType: grantType, clientId: clientId, clientSecret: clientSecret, scope: scope)).responseJSON {
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
                let accessToken = json["access_token"].stringValue
                completionHandler(accessToken, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    func loginWithSocial(accessTokcen: String,
                           provider: String,
                           completionHandler: @escaping (User?, Error?) -> Void) {
        
        AF.request(SehaKhanahRouter.loginWithSocial(accessTocken: accessTokcen, provider: provider)).responseJSON {
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
