//
//  ResetForgetPasswordPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 2/16/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class ResetForgetPasswordPresenter{
    private let forgetPasswordInteractor:ResetForgetPasswordInteractor
    private var user:User
    private weak var view: ResetForgetPasswordProtocol?
    init(view: ResetForgetPasswordProtocol) {
        self.view = view
        self.forgetPasswordInteractor = ResetForgetPasswordInteractor()
        user = User()
    }
    
    func resetPassword(email: String,
                       userType: String,token:String,password:String,confirmPassword:String) {
        
        view?.showIndicator()
        forgetPasswordInteractor.resetPassword(email: email, userType: userType, token: token, password: password, confirmPassword: confirmPassword){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: "")
            }else{
                
                if result != nil{
                    self.user = result!
                    self.view?.resetPasswordSuccess(user: self.user)
                }
                
            }
            
        }
    }
}
