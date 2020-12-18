//
//  SehaKhanahAPI.swift
//  Seha Khanah
//
//  Created by Anas on 12/16/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Moya

enum SehaKhanahAPI {
   
    case getOffersCategories
    
}

extension SehaKhanahAPI {
    var sampleData: Data {
        switch self {
            
        case .getOffersCategories:
            return stubbedResponse("getOffersCategories")
     
        }
    }
    
    func stubbedResponse(_ file:String) -> Data!{
        @objc class TestClass : NSObject {}
        let b = Bundle(for: TestClass.self)
        let path = b.path(forResource: file, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    
}



extension SehaKhanahAPI :TargetType {
    
    
    var baseURL: URL {
        return URL(string:"https://laravelapi.sehakhanah.com/api")!
    }
    
    var path: String {
        switch self {
            
     
        case .getOffersCategories:
            return "/offer/categories"
        
       
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    
//    var parameters:[String:Any] {
//        switch self {
//
//        case .searchEverything(let query) :
//            return ["term":query]
//
//        }
    //}
    
    
    var task: Task {
        switch self {
            
        case .getOffersCategories :
            return .requestPlain
        }
    }
    
    
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
    
    
}
