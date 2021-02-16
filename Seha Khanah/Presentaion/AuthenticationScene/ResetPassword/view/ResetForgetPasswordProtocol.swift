//
//  ResetForgetPasswordProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 2/16/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol ResetForgetPasswordProtocol:class {
    func showIndicator()
       func hideIndicator()
       func resetPasswordSuccess(user: User)
       func showError(error: String)
       func showNoDataFoundImage()
}
