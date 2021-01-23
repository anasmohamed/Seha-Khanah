//
//  MostOrderedOffersPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class MostOrderedOffersPresenter {
    private let offersInteractor:OffersInteractor
    private var mostOrderedOffers: [MostOrderedOffers]
    private var mostOrderedOffersImages: [MostOrderedOffersImage]

    private weak var view: MostOrderedOffersViewProtocol?
    init(view: MostOrderedOffersViewProtocol) {
        self.view = view
        self.offersInteractor = OffersInteractor()
        mostOrderedOffers = [MostOrderedOffers]()
        mostOrderedOffersImages = [MostOrderedOffersImage]()
    }
    
    func getMostOrderedOffers() {
        
        view?.showIndicator()
        offersInteractor.getMostOrderedOffers{ (result,error)  in
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
    func getMostOrderedOffersImage() {
           
           view?.showIndicator()
           offersInteractor.offerSlidShow{ (result,error)  in
               if let error = error {
                   print("errrror\(error)")
                   self.view?.showError(error: error.localizedDescription)
               } else {
                   if result != nil{
                       self.mostOrderedOffersImages = result!
                    self.view?.getMostOrderedOffersImageSuccess(images:self.mostOrderedOffersImages)
                   }
                   
               }
               
           }
       }
  
    public func getMostOrderedOfferCount() -> Int {
        return mostOrderedOffers.count
    }
    
    func configure(cell: MostOrderedOffersTableViewCellView, for index: Int) {
        print(mostOrderedOffers.count)
        if mostOrderedOffers.count > 0{
            let mostOrderedOffer = mostOrderedOffers[index]
            cell.configure(mostOrderedOffer: mostOrderedOffer)
        }
        
    }
    
}

