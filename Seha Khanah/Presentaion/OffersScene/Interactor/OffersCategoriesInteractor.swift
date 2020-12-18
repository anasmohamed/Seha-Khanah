//
//  OffersInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
class OffersCategoriesInteractor {

func getOffersCategories(
           completionHandler: @escaping (User?, Error?) -> Void) {
    
    Alamofire.request(LuzazRouter.login(email: email, password: password)).responseJSON {
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
            let json = JSON(result.value)
            print(json)
            
            if json["code"].stringValue == "1" {
                completionHandler(nil, nil)
            } else {
                let jsonUser = json["data"].object
            print(jsonUser)
                let user = User(withJSON: JSON(jsonUser))
                completionHandler(user, nil)
            }
            
        case .failure(let error):
            completionHandler(nil, error)
        }
    }
}
//
func register(user: User,
              completionHandler: @escaping (String?,Error?) -> Void) {
    
    Alamofire.request(LuzazRouter.register(user: user)).responseJSON {
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
        print(result)
        
        switch result {
        case .success:
            let json = JSON(result.value)
            print(json)
            
            if json["code"].stringValue == "1" {
                completionHandler(nil,json["description"].stringValue.errorDescription)
            } else {
                let jsonUser = json["data"].object
                print(jsonUser)}
            completionHandler(json["description"].stringValue,nil)
        case .failure(let error):
            completionHandler("",error)
        }
    }
}
