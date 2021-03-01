//
//  AddReviewInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 3/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class AddReviewInteractor {
    func AddReview(comment:String,rating:Double,bookId:Int,checkbox:Bool,
                  completionHandler: @escaping (String?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.addReview(comment: comment, rating: rating, bookId: bookId, checkBox: checkbox)).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
             
                completionHandler(json["message"].stringValue, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
}
