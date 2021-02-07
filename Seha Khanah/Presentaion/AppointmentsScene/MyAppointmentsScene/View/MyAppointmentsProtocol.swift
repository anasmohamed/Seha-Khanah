//
//  MyAppointmentsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol MyAppointmentsProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getMyAppointmentsSuccess()
    func showError(error: String)
    func showNoDataFoundStackView()
}
