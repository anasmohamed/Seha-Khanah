//
//  SearchByNameInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class SearchByNameInteractor{
    func searchBy(name:String,
       completionHandler: @escaping ([SearchedResults]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.searchByName(name:name)).validate().responseJSON{
           (response) in
           let result = response.result
           switch result {
           case .success :
               let json = JSON(response.value)
               print(json)
               var searchedResultsList = [SearchedResults]()
               let searchedResults = json["data"]["search"].arrayValue
               print("results \(searchedResults)")
               print("results \(searchedResults.count)")

               for searchedResult in searchedResults
               {
                   let data = SearchedResults(withJSON: searchedResult)
                   searchedResultsList.append(data!)
                   
               }
               completionHandler(searchedResultsList, nil)
           case .failure(let error):
               completionHandler(nil, error)
           }
           
       }}
    func searchByAreaAndSepcialty(areaId:String,sepcialtyId:String,
    completionHandler: @escaping ([SearchedResults]?, Error?) -> Void) {
     AF.request(SehaKhanahRouter.searchByAreaAndSpecialty(areaId: areaId, specialtyId: sepcialtyId)).validate().responseJSON{
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
            var searchedResultsList = [SearchedResults]()
            let searchedResults = json["data"]["search"].arrayValue
            print("results \(searchedResults)")
            print("results \(searchedResults.count)")

            for searchedResult in searchedResults
            {
                let data = SearchedResults(withJSON: searchedResult)
                searchedResultsList.append(data!)
                
            }
            completionHandler(searchedResultsList, nil)
        case .failure(let error):
            completionHandler(nil, error)
        }
        
    }}
}
