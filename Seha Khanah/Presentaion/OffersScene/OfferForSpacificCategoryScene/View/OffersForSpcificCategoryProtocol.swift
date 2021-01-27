//
//  OffersForSpcificCategoryProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol OffersForSpcificCategoryProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getOffersForSpcificCategorySuccess()
    func showError(error: String)
    func noDataFound()
}
