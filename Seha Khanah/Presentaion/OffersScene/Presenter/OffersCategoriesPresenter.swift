//
//  OffersCategoriesPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class OffersCategoriesPresenter {
    private weak var view: OffersCategorisViewProtocol?
    init(view: OffersCategorisViewProtocol) {
        self.view = view
    }
    
    func getOffersCategories() {
        
        view?.showIndicator()
        SehaKhanahAPIClient.getOffersCategories{ result in
            
            self.view?.hideIndicator()
            
            switch result {
            case .success(let offersCategoris):
                print(offersCategoris)
                
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
}








