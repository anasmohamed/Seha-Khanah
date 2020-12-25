//
//  SearchByLabNameProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol SearchByLabNameProtocol:class {
    func showIndicator()
    func hideIndicator()
    func labsResults()
    func showError(error: String)
    func showNoDataFoundImage()
}
