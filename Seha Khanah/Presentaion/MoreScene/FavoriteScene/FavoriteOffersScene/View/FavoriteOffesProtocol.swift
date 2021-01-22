//
//  FavoriteOffesProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/18/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

protocol FavoriteOffesProtocol: class {

    func showIndicator()
    func hideIndicator()
    func getFavoriteOffersSuccess()
    func showError(error: String)
    func showNoDataFoundImage()

}
