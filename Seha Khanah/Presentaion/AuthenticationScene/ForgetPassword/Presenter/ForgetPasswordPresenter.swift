//
//  ForgetPasswordPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 2/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class  ForgetPasswordPresenter {
    private let forgetPasswordInteractor:ForgetPasswordInteractor
          private var user:User
          private weak var view: ForgetPasswordProtocol?
          init(view: ForgetPasswordProtocol) {
              self.view = view
              self.forgetPasswordInteractor = ForgetPasswordInteractor()
              user = User()
          }
          
       func resetPassword(phone:String,userType:String) {
              
              view?.showIndicator()
        forgetPasswordInteractor.resetPassword(phone:phone , userType:userType){ (result,error)  in
                  if let error = error {
                      print("errrror\(error)")
                      self.view?.showError(error: "")
                  }else{
                
                      if result != nil{
                          self.user = result!
                        self.view?.getMessageSuccess(user: self.user)
                      }
                      
                  }
                  
              }
          }
}
