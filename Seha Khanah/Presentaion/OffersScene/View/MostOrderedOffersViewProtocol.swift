//
//  MostOrderedOffersViewProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol MostOrderedOffersViewProtocol: class {
    func showIndicator()
    func hideIndicator()
    func getMostOrderedOffersSuccess()
    func showError(error: String)
}
