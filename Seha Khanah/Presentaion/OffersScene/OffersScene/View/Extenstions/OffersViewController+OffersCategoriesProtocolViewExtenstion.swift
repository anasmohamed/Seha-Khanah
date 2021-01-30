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
        self.view.isUserInteractionEnabled = true

    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()

    }
    func showError(error: String) {
        indicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
        self.view.makeToast(error, duration: 3.0, position: .top)

        print("error \(error)")
    }
    
}
