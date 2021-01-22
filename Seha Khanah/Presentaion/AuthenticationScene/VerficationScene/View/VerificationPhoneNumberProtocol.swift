//
//  VerificationPhoneNumberProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/22/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol VerificationPhoneNumberProtocol:class {
    func showIndicator()
    func hideIndicator()
    func sendMessageSuccuess(message:String)
    func showError(error: String)
}
