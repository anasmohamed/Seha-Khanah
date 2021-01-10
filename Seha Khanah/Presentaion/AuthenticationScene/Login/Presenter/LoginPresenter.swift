//
//  LoginPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation

class LoginPresenter  {
    private let loginInteractor:LoginInteractor
    private var user:User
    private weak var view: LoginProtocol?
    init(view: LoginProtocol) {
        self.view = view
        self.loginInteractor = LoginInteractor()
        user = User()
    }
    
    func login(email:String,password:String) {
        
        view?.showIndicator()
        loginInteractor.login(email: email, password: password){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.user = result!
                    self.view?.loginSuccess(user: self.user)
                }
                
            }
            
        }
    }
    func loginWithFacebook(accessTokcen: String,
    provider: String) {
        
        view?.showIndicator()
        loginInteractor.loginWithFacebook(accessTokcen: accessTokcen,
        provider: provider){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.user = result!
                    self.view?.loginSuccess(user: self.user)
                }
                
            }
            
        }
    }
}
