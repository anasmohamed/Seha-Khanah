//
//  AllCategoriesProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol AllCategoriesProtocol :class{
    func showIndicator()
    func hideIndicator()
    func getOffersCategorisSuccess()
    func showError(error: String)
}
