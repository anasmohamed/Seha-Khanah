//
//  FavoriteDoctorProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/18/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol FavoriteDoctorProtocol:class {
    func showIndicator()
       func hideIndicator()
       func getFavoriteDoctorsSuccess()
       func showError(error: String)
       func showNoDataFoundImage()
}
