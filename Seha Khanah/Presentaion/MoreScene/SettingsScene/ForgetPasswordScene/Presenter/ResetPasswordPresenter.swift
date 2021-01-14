//
//  ForgetPasswordsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class ResetPasswordPresenter {
    private let resetPasswordInteractor:ResetPasswordInteractor
    private var user:User
    private weak var view: ResetPasswordProtocol?
    init(view: ResetPasswordProtocol) {
        self.view = view
        self.resetPasswordInteractor = ResetPasswordInteractor()
        user = User()
    }
    
    func resetPassword(email:String,userType:String,token:String,password:String,passwordConfirmation:String) {
        view?.showIndicator()
        resetPasswordInteractor.resetPassword(email:email , userType:userType , token:token , password:password , passwordConfirmation: passwordConfirmation){
            (result,error)  in
            
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.user = result!
                    self.view?.resetPasswordSuccess(user: self.user)
                }
                
            }
        }
        
    }
}
