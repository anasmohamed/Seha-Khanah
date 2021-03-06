//
//  SearchByLabNameInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class SearchByLabNameInteractor {
    func searchByLabName(name : String,
                  completionHandler: @escaping ([Lab]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.searchByLabName(name: name)).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                var labList = [Lab]()
                let labs = json["data"]["search"].arrayValue
               
                
                for lab in labs
                {
                    let data = Lab(withJSON: lab)
                    labList.append(data!)
                    
                }
                completionHandler(labList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
    func searchForLabByAreaId(areadId:String,
                    completionHandler: @escaping ([Lab]?, Error?) -> Void) {
          AF.request(SehaKhanahRouter.searchForLabByAreaId(areaId: areadId)).validate().responseJSON{
              (response) in
                        
                          
              let result = response.result
              switch result {
              case .success :
                  let json = JSON(response.value)
                  print(json)
                  var labsList = [Lab]()
                  let labs = json["data"]["search"].arrayValue
                 
                  
                  for lab in labs
                  {
                      let data = Lab(withJSON: lab)
                      labsList.append(data!)
                      
                  }
                  completionHandler(labsList, nil)
              case .failure(let error):
                  completionHandler(nil, error)
              }
              
          }
          
      }
    
    func getAllLabs(
                  completionHandler: @escaping ([Lab]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.getAllLabs).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                var labList = [Lab]()
                let labs = json["data"]["search"].arrayValue
               
                
                for lab in labs
                {
                    let data = Lab(withJSON: lab)
                    labList.append(data!)
                    
                }
                completionHandler(labList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
}

