//
//  SehaKhanahAPIClient.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire

class SehaKhanahAPIClient {
    
   
    
    @discardableResult
     private static func performRequest<T:Decodable>(route:SehaKhanahRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    static func getOffersCategories(completion:@escaping (Result<OffersCategory, AFError>)->Void) {
        self.performRequest(route: SehaKhanahRouter.getOffersCategories, completion: completion)
    }
    
    
}
