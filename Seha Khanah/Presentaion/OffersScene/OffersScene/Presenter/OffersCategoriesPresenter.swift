//
//  OffersCategoriesPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class OffersCategoriesPresenter {
    private let offersInteractor:OffersInteractor
    private var offers: [OffersCategory]
    private weak var view: OffersCategorisViewProtocol?
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
                let nameEn = offerCategory.nameEn
                else { return }
            
            cell.configure(image: image, categoryName: nameEn)
        }
        
    }}







