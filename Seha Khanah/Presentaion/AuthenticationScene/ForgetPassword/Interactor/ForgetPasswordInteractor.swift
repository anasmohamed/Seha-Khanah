//
//  ForgetPasswordInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 2/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class ForgetPasswordInteractor {
    func resetPassword(phone: String,
                         userType: String,
                         completionHandler: @escaping (User?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.createCodeForResetPassword(email: phone, userType: userType)).responseJSON {
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
                        let user = User(withJSON: json["data"])
                        completionHandler(user, nil)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
            }
        }
//        guard let url = URL(string: "https://laravelapi.sehakhanah.com/api/password/create") else {
//            return
//        }
//
//        let accesstoken = UserDefaults.standard.string(forKey: "accessToken")
//
//
//        let data : Data = "phonenumber=\(phone)&user_type=\(userType)".data(using: .utf8)!
//        var request : URLRequest = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue(accesstoken, forHTTPHeaderField:"Authorization");
//
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
////        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
//        request.httpBody = data
//
//        print("one called")
//
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        // vs let session = URLSession.shared
//        // make the request
//        let task = session.dataTask(with: request, completionHandler: {
//            (data, response, error) in
//
//            if let error = error
//            {
//                print(error)
//            }
//            else if let response = response {
//                print("her in resposne")
//                print(response)
//            }else if let data = data
//            {
//                print("here in data")
//                print(data)
//            }
//
//            DispatchQueue.main.async { // Correct
//
//                guard let responseData = data else {
//                    print("Error: did not receive data")
//                    return
//                }
//
//
//                let json =  try? JSON(data: responseData)
//                print(json!["message"])
//                if json!["success"] == true{
//                    let userJson = json!["data"]
//                    let user = User(withJSON: userJson)
//
//                    completionHandler(user,nil)
//                }else{
//                    completionHandler(nil,json!["message"].stringValue)
//
//                }
//                do {
//                    //  let todo = try decoder.decode(T.self, from: responseData)
//                    //  NSAssertionHandler(.success(todo))
//                } catch {
//                    print("error trying to convert data to JSON")
//                    //print(error)
//                    //  NSAssertionHandler(.failure(error))
//                }
//            }
//        })
//        task.resume()
        
        
    }
//}
