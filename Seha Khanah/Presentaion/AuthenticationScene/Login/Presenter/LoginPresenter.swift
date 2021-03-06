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
    private var accessToken:String?
    
    private weak var view: LoginProtocol?
    
    init(view: LoginProtocol) {
        self.view = view
        self.loginInteractor = LoginInteractor()
        user = User()
        accessToken = String()
    }
    
    func login(email:String,password:String) {
        
        view?.showIndicator()
        loginInteractor.login(email: email, password: password){ (result,message,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            }else if let message = message{
                self.view?.showError(error: message)
                
            }
            else {
                if result != nil{
                    self.user = result!
                    self.view?.loginSuccess(user: self.user)
                }
                
            }
            
        }
    }
    func getUserToken(grantType: String,clientId:String,clientSecret:String,scope:String){
        view?.showIndicator()
        loginInteractor.getUserToken(grantType: grantType, clientId: clientId, clientSecret: clientSecret, scope: scope){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.accessToken = result!
                    self.view?.getAccessTokenSuccess(accessToken:self.accessToken!)
                }
                
            }
            
        }
    }
    func returnAccessToken() -> String {
        return accessToken!
    }
    func loginWithSocial(accessToken: String,
                         provider: String) {
        
        view?.showIndicator()
        loginInteractor.loginWithSocial(accessTokcen: accessToken,
                                        provider: provider){ (result,error)  in
                                            if let error = error {
                                                print("errrror\(error)")
                                                self.view?.showErrorWithSocial(error: "Something Wrong Happend")
                                            } else {
                                                if result != nil{
                                                    self.user = result!
                                                    self.view?.loginSuccessWithFacebook(user: self.user)
                                                }
                                                
                                            }
                                            
        }
    }
}
