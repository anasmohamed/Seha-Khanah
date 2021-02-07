//
//  OfferSubCategoryPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/23/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import MOLH

class OfferSubCategoryPresenter {
    private let offerSubCategoryInteractor:OfferSubCategoryInteractor
    private var offers: [OffersCategory]
    private weak var view: OfferSubCategoryProtocol?
    init(view: OfferSubCategoryProtocol) {
        self.view = view
        self.offerSubCategoryInteractor = OfferSubCategoryInteractor()
        offers = [OffersCategory]()
        
    }
    
    func getOffersCategories(id:String) {
        
        view?.showIndicator()
        offerSubCategoryInteractor.getOfferSubCategories(id: id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.offers = result!
                    self.view?.getOffersSubCategorySuccess()
                }
                
            }
            
        }
    }
    func getOffersSubCategoryName(index:Int) -> String {
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            return offers[index].nameEn!
        }else{
            return offers[index].nameAr!
            
        }
    }
    func getOffersSubCategoryId(index:Int)-> String
    {
        return offers[index].id!
    }
    func getOffersSubCategoryCount() -> Int {
        return offers.count
    }
}
