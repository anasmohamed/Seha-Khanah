//
//  ForgetPasswordProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol ResetPasswordProtocol:class {
    func showIndicator()
    func hideIndicator()
    func resetPasswordSuccess(user:User)
    func showError(error: String)
}
