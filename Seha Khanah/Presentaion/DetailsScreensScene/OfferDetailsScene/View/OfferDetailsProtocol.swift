//
//  OfferDetailsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/20/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol OfferDetailsProtocol:class {
    func showIndicator()
      func hideIndicator()
      func showOfferDetails(doctorDetails: OfferDetails)
      func showError(error: String)
      func showNoDataFoundImage()
      func showDoctorDates()
}
