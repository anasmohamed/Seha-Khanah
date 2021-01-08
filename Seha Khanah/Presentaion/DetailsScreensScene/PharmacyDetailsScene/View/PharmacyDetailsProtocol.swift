//
//  PharmacyDetailsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol PharmacyDetailsProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getPharmacyDetailsSuccess(pharmacy: PharmacyDetails)
    func showError(error: String)
}
