//
//  APIManger.swift
//  Seha Khanah
//
//  Created by Anas on 12/16/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Moya
import Foundation
import SwiftyJSON

protocol Networkable {

    func getOffersCategories<T>(completion: @escaping (Result<T,NetworkError>) -> ())
}

struct NetworkManger:Networkable{

fileprivate let provider = MoyaProvider<SehaKhanahAPI>()
    
    
    
    func getOffersCategories<T>(completion: @escaping (Result<T,NetworkError>) -> ()) {
        provider.request(.getOffersCategories) { (result) in
               switch result {
               case let .success(response):
                   let json = try!  JSON(data: response.data)
                  // print(json)
                   completion(.success())
               case let .failure(error):
                   print(error)
                   completion(nil, error)
               }
           }
       }
        
        
        
        
        
        
    }
