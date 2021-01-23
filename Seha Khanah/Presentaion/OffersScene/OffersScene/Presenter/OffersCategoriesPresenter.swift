//
//  OffersCategoriesPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import MOLH

class OffersCategoriesPresenter {
    private let offersInteractor:OffersInteractor
    private var offers: [OffersCategory]
    private weak var view: OffersCategorisViewProtocol?
    let locale = NSLocale.current.languageCode
    init(view: OffersCategorisViewProtocol) {
        self.view = view
        self.offersInteractor = OffersInteractor()
        offers = [OffersCategory]()
        
    }
    
    func getOffersCategories() {
        
        view?.showIndicator()
        offersInteractor.getOffersCategoris{ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.offers = result!
                    self.view?.getOffersCategorisSuccess()
                }
                
            }
            
        }
    }
    public func getOffersCategoriesCount() -> Int {
        return offers.count
    }
    func getOfferId(index:Int) -> String {
        return offers[index].id!
    }
    
    func configure(cell: OffersCategorisCellView, for index: Int,section:Int) {
        print(offers.count)
        
        if offers.count > 0{
            let offerCategory : OffersCategory
            if section == 0{
                offerCategory = offers[0]
                
            }
            else{
                
                offerCategory = offers[index + 1]
                
            }
            
            
            
            
            
            guard let image = offerCategory.photo,
                let nameEn = offerCategory.nameEn,
                let nameAr = offerCategory.nameAr
                else { return }
            if  MOLHLanguage.currentAppleLanguage() == "en"
            {
                cell.configure(image: image, categoryName: nameEn)
                
            }else
            {            cell.configure(image: image, categoryName: nameAr)
                
                
            }
        }
        
    }
    
}








