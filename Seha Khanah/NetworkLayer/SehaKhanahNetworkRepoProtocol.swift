//
//  SehaKhanahNetworkRepo.swift
//  Seha Khanah
//
//  Created by Anas on 12/17/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
enum NetworkError : String, Error {
    case noInternet = "Please check internet connection"
    case notFound = "No data found or page removed"
}


typealias getOffersCategoriesCompletionHandler<T> = (Result<T, NetworkError>) -> ()


protocol SehaKhanahRepoProtocol {
    
    var network:Networkable? {get set}
    
    func getOffersCategories<T>(complitionHandler:  @escaping getOffersCategoriesCompletionHandler<T>)
    
    
    
}

//import Foundation
//import Moya
//import SwiftyJSON
//
//protocol Networkable {
//
//    func getOffersCategories(completion: @escaping ([Movie]?, Swift.Error?) -> ())
//}
//
//struct NetworkManger:Networkable{
//
//fileprivate let provider = MoyaProvider<SehaKhanahAPI>()
//    
//    
//    
//    func getOffersCategories(completion: @escaping (Result<T,NetworkError>) -> ()) {
//        provider.request(.getOffersCategories) { (result) in
//               switch result {
//               case let .success(response):
//                   let json = try!  JSON(data: response.data)
//                  // print(json)
//                   completion(MovieResults(from: json).movies, nil)
//               case let .failure(error):
//                   print(error)
//                   completion(nil, error)
//               }
//           }
//       }
//        
//        
//        
//        
//        
//        
//    }
