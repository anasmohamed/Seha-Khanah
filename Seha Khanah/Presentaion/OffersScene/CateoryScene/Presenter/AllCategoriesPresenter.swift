//
//  AllCategoriesPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import MOLH

class AllCategoriesPresenter {
    private let allCategoriesInteractor:AllCategoriesInteractor
    private var offers: [OffersCategory]
    private weak var view: AllCategoriesProtocol?
    let locale = NSLocale.current.languageCode
    init(view: AllCategoriesProtocol) {
        self.view = view
        self.allCategoriesInteractor = AllCategoriesInteractor()
        offers = [OffersCategory]()
        
    }
    
    func getOffersCategories() {
        
        view?.showIndicator()
        allCategoriesInteractor.getAllCategories{ (result,error)  in
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
    func getOfferSubCategoriesCount(index:Int) -> Int {
        return offers[index].subCategoriesList.count 
    }
    public func getOffersCategoriesCount() -> Int {
        return offers.count
    }
    func getOfferSubCategoriesId(index:Int,subIndex:Int) -> String {
        return offers[index].subCategoriesList[subIndex].id!

    }
    func getOffersCategoryName(index:Int) -> String {
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            return offers[index].nameEn!
        }else{
            return offers[index].nameAr!
            
        }
    }
    func getOffersSubCategoryName(index:Int,subIndex:Int) -> String {
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            return offers[index].subCategoriesList[subIndex].nameEn!
        }else{
            return offers[index].subCategoriesList[subIndex].nameAr!
            
        }
    }
}
