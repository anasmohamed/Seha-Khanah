//
//  AboutAppProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol AboutAppProtocol:class {
  func showIndicator()
    func hideIndicator()
    func aboutAppResults()
    func showError(error: String)
    func showNoDataFoundImage()
}
