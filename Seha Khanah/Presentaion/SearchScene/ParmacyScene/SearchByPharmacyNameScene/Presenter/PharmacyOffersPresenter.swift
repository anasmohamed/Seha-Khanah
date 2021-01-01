//
//  PharmacyOffersPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class PharmacyOffersPresenter {
    private let pharmacyOffersInateractor:PharmacyOffersInateractor
    private var pharmacyOffers: [PharmacyOffer]
    private weak var view: PharmacyOffersViewProtocol?
    init(view: PharmacyOffersViewProtocol) {
        self.view = view
        self.pharmacyOffersInateractor = PharmacyOffersInateractor()
        pharmacyOffers = [PharmacyOffer]()
    }
    
    func getPharmacyOffers() {
        
        view?.showIndicator()
        pharmacyOffersInateractor.getPharmacyOffers{ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    if (result!.count == 0)
                    {self.view?.showNoDataFoundImage()
                        
                    }else{
                        self.pharmacyOffers = result!
                        self.view?.pharamcyOffersResults()
                    }}
                
            }
            
        }
    }
    
    public func pharmacyOffersCount() -> Int {
        return pharmacyOffers.count
    }
    
    
    func configure(cell: PharmacyOfferTableViewCellViewProtocol, for index: Int) {
        print(pharmacyOffers.count)
        if pharmacyOffers.count > 0{
            let pharmacyOffer = pharmacyOffers[index]
            
            cell.configure(offer: pharmacyOffer)
        }
        
    }
}
