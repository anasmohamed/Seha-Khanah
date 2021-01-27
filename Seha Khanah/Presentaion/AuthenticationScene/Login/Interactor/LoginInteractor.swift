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
                           completionHandler: @escaping (User?, String?) -> Void) {
       
//         var httpHeaders = HTTPHeaders()
//        httpHeaders.add(name: "Content-Type", value:"application/x-www-form-urlencoded" )
        let accesstoken = UserDefaults.standard.string(forKey: "accessToken")
//        httpHeaders.add(name: "Authorization", value: "Bearer \(accesstoken!)")
//        httpHeaders.add(name: "Content-Type", value:"application/X-Access-Token")
//        var request : URLRequest = URLRequest(url: URL(string: "https://laravelapi.sehakhanah.com/api/social-mobile")!)
//
//      //  let parameters = ["email":accessTokcen,"provider":provider]
//        let data : Data = "email=\(accessTokcen)&provider=\(provider)".data(using: .utf8)!
//        request.httpBody = data
//        AF.request(request as! URLConvertible, method: .post, parameters: nil, encoding:  URLEncoding.httpBody, headers: httpHeaders).responseJSON {
//            (response) in
//
//            if let response = response.data {
//                print("Response Data: \(response)")
//            } else {
//                print("Response Data: nil")
//            }
//            if let request = response.request {
//                print("Request Request: \(request)")
//                print("Request Description: \(request.description)")
//                print("Request Debug Description: \(request.debugDescription)")
//
//                print("Response Request HTTP method: \(request.httpMethod!)")
//                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
//            } else {
//                print("Response Request: nil")
//            }
//
//            if let responseStatusCode = response.response {
//                print("Response Status Code: \(responseStatusCode.statusCode)")
//            } else {
//                print("Response Status Code: nil")
//            }
//
//            if let error = response.error {
//                print("Response Error Code: \(error.localizedDescription)")
//            } else {
//                print("Response Error Code: nil")
//            }
//
//            let result = response.result
//            switch result {
//            case .success:
//                let json = JSON(response.value)
//                print(json)
//                let jsonUser = json["data"].object
//                print(jsonUser)
//                let user = User(withJSON: JSON(jsonUser))
//                completionHandler(user, nil)
//            case .failure(let error):
//                completionHandler(nil, error)
//            }
//        }
        guard let url = URL(string: "https://laravelapi.sehakhanah.com/api/social-mobile") else {
                return
            }


            
            let data : Data = "email=\(accessTokcen)&provider=\(provider)".data(using: .utf8)!
            var request : URLRequest = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
            request.setValue(accesstoken, forHTTPHeaderField:"Authorization");
            request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
            request.httpBody = data

            print("one called")

            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            // vs let session = URLSession.shared
              // make the request
            let task = session.dataTask(with: request, completionHandler: {
                (data, response, error) in

                 if let error = error
                {
                    print(error)
                }
                 else if let response = response {
                    print("her in resposne")
print(response)
                }else if let data = data
                 {
                    print("here in data")
                    print(data)
                }

                DispatchQueue.main.async { // Correct

                    guard let responseData = data else {
                        print("Error: did not receive data")
                        return
                    }

                    
                    let json =  try? JSON(data: responseData)
                    print(json!["success"])
                    if json!["success"] == true{
                        let userJson = json!["data"]
                        let user = User(withJSON: userJson)
                        completionHandler(user,nil)
                    }else{
                        completionHandler(nil,json!["message"].stringValue)

                    }
                    do {
                      //  let todo = try decoder.decode(T.self, from: responseData)
                      //  NSAssertionHandler(.success(todo))
                    } catch {
                        print("error trying to convert data to JSON")
                        //print(error)
                      //  NSAssertionHandler(.failure(error))
                    }
                }
            })
            task.resume()


        }
//        AF.request(SehaKhanahRouter.loginWithSocial(accessTocken: accessTokcen, provider: provider)).responseJSON {
//            (response) in
//
//            if let response = response.data {
//                print("Response Data: \(response)")
//            } else {
//                print("Response Data: nil")
//            }
//            if let request = response.request {
//                print("Request Request: \(request)")
//                print("Request Description: \(request.description)")
//                print("Request Debug Description: \(request.debugDescription)")
//
//                print("Response Request HTTP method: \(request.httpMethod!)")
//                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
//            } else {
//                print("Response Request: nil")
//            }
//
//            if let responseStatusCode = response.response {
//                print("Response Status Code: \(responseStatusCode.statusCode)")
//            } else {
//                print("Response Status Code: nil")
//            }
//
//            if let error = response.error {
//                print("Response Error Code: \(error.localizedDescription)")
//            } else {
//                print("Response Error Code: nil")
//            }
//
//            let result = response.result
//            switch result {
//            case .success:
//                let json = JSON(response.value)
//                print(json)
//                let jsonUser = json["data"].object
//                print(jsonUser)
//                let user = User(withJSON: JSON(jsonUser))
//                completionHandler(user, nil)
//            case .failure(let error):
//                completionHandler(nil, error)
//            }
//        }
    }
//}
