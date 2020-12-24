//
//  GetRegionInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class RegionInteractor {
    func getAreas(
                  completionHandler: @escaping ([Area]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.getAreas).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                var areaList = [Area]()
                let areas = json["data"].arrayValue
               
                
                for area in areas
                {
                    let data = Area(withJSON: area)
                    areaList.append(data!)
                    
                }
                completionHandler(areaList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
}
