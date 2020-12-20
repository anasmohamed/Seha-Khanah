//
//  OffersViewController+OffersCategoriesProtocolViewExtenstion.swift
//  Seha Khanah
//
//  Created by Anas on 12/20/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
extension OffersViewController :OffersCategorisViewProtocol{
    func getOffersCategorisSuccess() {
        offersCategoriesCollectionView.reloadData()
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    func showError(error: String) {
        print("error \(error)")
    }
    
}
