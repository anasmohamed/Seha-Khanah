//
//  PharmacyOffersViewProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol PharmacyOffersViewProtocol:class{
    func showIndicator()
     func hideIndicator()
     func pharamcyOffersResults()
     func showError(error: String)
     func showNoDataFoundImage()
}
