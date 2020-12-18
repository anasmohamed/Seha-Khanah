//
//  SehaKhanahAPIManeger.swift
//  Seha Khanah
//
//  Created by Anas on 12/17/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum SehaKhanahRouter: URLRequestConvertible {
    
    case getOffersCategories
   
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
      
        case .getOffersCategories:
            return .get
        
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getOffersCategories:
            return NetworkingConstants.getOffersCategories
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getOffersCategories:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkingConstants.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
