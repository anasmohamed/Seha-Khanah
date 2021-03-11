//
//  UserOffersReservationsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/23/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol UserOffersReservationsProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getMyOffersSuccess()
    func showError(error: String)
    func showNoDataFoundStackView()
    func cancelReservationSuccess()

}
