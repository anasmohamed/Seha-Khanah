//
//  SehaKhanahRepo.swift
//  Seha Khanah
//
//  Created by Anas on 12/17/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class SehaKhanahRepo : SehaKhanahRepoProtocol {
    var network: Networkable?
    
    
//    let network = NewtorkManger()
    
    
    
    

   
    typealias getOffersCategoriesCompletionHandler<T> = (Result<T,NetworkError>) -> ()
    
    func getOffersCategories<T>(complitionHandler:  @escaping getOffersCategoriesCompletionHandler<T>){
       
        network?.fetchData(target: .getOffersCategories, complitionHandler: <#T##(Result<T, NetworkError>) -> ()#>)
       
        
    }
    
    
    
    
    
    
    
}
