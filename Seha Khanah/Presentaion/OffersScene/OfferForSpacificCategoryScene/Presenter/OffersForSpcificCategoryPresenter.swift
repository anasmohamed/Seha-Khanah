//
//  OffersForSpcificCategoryPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class OffersForSpcificCategoryPresenter {
    private let offersInteractor:OffersForSpcificCategoryInteractor
    private var mostOrderedOffers: [MostOrderedOffers]
    
    private weak var view: MostOrderedOffersViewProtocol?
    init(view: MostOrderedOffersViewProtocol) {
        self.view = view
        self.offersInteractor = OffersForSpcificCategoryInteractor()
        mostOrderedOffers = [MostOrderedOffers]()
    }
    
    func getMostOrderedOffers(id:String) {
        
        view?.showIndicator()
        offersInteractor.getOffersForSpcificCategory(id: id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.mostOrderedOffers = result!
                    self.view?.getMostOrderedOffersSuccess()
                }
                
            }
            
        }
    }
}
