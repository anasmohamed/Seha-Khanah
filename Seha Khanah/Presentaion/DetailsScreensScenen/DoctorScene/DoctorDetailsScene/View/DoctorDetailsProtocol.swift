//
//  DoctorDetailsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/6/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol DoctorDetailsProtocol:class {
    func showIndicator()
    func hideIndicator()
    func showDoctorDetails(doctorDetails: DoctorDetails)
    func showError(error: String)
    func showNoDataFoundImage()
    func showDoctorDates()
}
