//
//  MyLabsAppointmentsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 3/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol MyLabsAppointmentsProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getMyLabsAppointmentsSuccess()
    func showError(error: String)
    func showNoDataFoundStackView()
}
