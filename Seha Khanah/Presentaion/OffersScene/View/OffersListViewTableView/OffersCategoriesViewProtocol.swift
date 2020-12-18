//
//  OffersCategoriesViewProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation

protocol OffersCategorisViewProtocol: class {
    func showIndicator()
    func hideIndicator()
    func getOffersCategorisSuccess(category: OffersCategory)
    func showError(error: String)
}
