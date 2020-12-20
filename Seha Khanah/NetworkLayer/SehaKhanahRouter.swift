//
//  LuzazRouter.swift
//  Luzaz
//
//  Created by jets on 12/15/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire

enum SehaKhanahRouter: URLRequestConvertible {
    
    
    case getOffersCategories
    case getMostOrderedOffers
    
    
    var path: String {
        switch self {
        case .getOffersCategories:
            return NetworkingConstants.getOffersCategories
        case .getMostOrderedOffers:
            return NetworkingConstants.getMostOrderedOffers
      

        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .getOffersCategories,.getMostOrderedOffers:
            return .get
      
            
        }
    }
    
//    var httpHeaders: HTTPHeaders {
//
//        let httpHeaders = [String:String]()
//
//        switch self {
//            //        case .getOffers:
//            //            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
//        //            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
//        default:
//            print("Empty request headers")
//        }
//
//        return httpHeaders
//    }
    
    var body: [String: Any] {
        
        let body = [String:Any]()
        
        switch self {
            
            
        default:
            print("Empty request body")
        }
        
        return body
    }
    
    var params: [String: Any] {
        
        var params = [String:Any]()
        
        switch self {
        
            
        default:
            print("Empty Paramter")
            
        }
        
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        switch self {
        case .getOffersCategories,.getMostOrderedOffers:
            
            return try URLEncoding.default.encode(urlRequest, with: params)
            
            //        case .register, .addBarber, .addService:
            //            return try JSONEncoding.default.encode(urlRequest, with: body)
            
        }
    }
}
