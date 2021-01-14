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
    private weak var view: MostOrderedOffersViewProtocol?
    init(view: MostOrderedOffersViewProtocol) {
        self.view = view
        self.offersInteractor = OffersInteractor()
        mostOrderedOffers = [MostOrderedOffers]()
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

