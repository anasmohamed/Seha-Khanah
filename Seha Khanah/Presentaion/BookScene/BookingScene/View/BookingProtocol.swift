//
//  BookingProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol BookingProtocol: class {
    func showIndicator()
       func hideIndicator()
       func bookingSuccess()
       func showError(error: String)
}
