//
//  LabDetailsProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
protocol LabDetailsProtocol :class{
   func showIndicator()
      func hideIndicator()
    func showLabDetails(labDetails: LabDetails)
      func showError(error: String)
      func showNoDataFoundImage()
}
