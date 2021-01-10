//
//  RegisterProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/10/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol RegisterProtocol:class {
    func showIndicator()
       func hideIndicator()
       func resgiterSuccess(user:User)
       func showError(error: String)
}
