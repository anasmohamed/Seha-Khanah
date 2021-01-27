//
//  LoginProtocol.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol LoginProtocol:class {
    func showIndicator()
    func hideIndicator()
    func loginSuccess(user:User)
    func showError(error: String)
    func showErrorWithSocial(error:String)
    func loginSuccessWithFacebook(user:User)
    func getAccessTokenSuccess(accessToken:String) 
}
