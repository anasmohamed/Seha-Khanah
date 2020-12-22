//
//  SearchViewProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol SearchViewProtocol: class {
    func showIndicator()
    func hideIndicator()
    func searchResults()
    func showError(error: String)
    func showNoDataFoundImage()
}
