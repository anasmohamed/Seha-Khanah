//
//  EditUserProfileProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/11/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol EditUserProfileProtocol:class {
    func showIndicator()
    func hideIndicator()
    func editProfileSuccess(user:User)
    func showError(error: String)
}
