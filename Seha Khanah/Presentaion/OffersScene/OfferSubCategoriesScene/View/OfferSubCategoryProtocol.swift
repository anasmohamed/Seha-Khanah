//
//  OfferSubCategoryProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/23/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol OfferSubCategoryProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getOffersSubCategorySuccess()    
    func showError(error: String)
}
