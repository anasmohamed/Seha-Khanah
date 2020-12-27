//
//  AboutAppInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class AboutAppInteractor {
    func getAboutApp(
    completionHandler: @escaping ([AboutApp]?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.aboutUs).validate().responseJSON{
        (response) in
        let result = response.result
        switch result {
        case .success :
            let json = JSON(response.value)
            print(json)
            //                print(result)
            var aboutDataList = [AboutApp]()
            var aboutAppDataArray = json["data"].arrayValue
            
            for aboutAppData in aboutAppDataArray
            {
                let data = AboutApp(withJSON: aboutAppData)
                aboutDataList.append(data!)
                
            }
            completionHandler(aboutDataList, nil)
        case .failure(let error):
            completionHandler(nil, error)
        }
        
    }}
}
