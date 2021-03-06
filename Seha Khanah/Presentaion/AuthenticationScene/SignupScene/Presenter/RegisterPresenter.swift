//
//  RegisterPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/10/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class RegisterPresenter {
    private let registerInteractor:RegisterInteractor
       private var user:User
       private weak var view: RegisterProtocol?
       init(view: RegisterProtocol) {
           self.view = view
           self.registerInteractor = RegisterInteractor()
           user = User()
       }
       
    func register(email:String,password:String,name:String,phoneNumber:String,genderId:String,birthday:Date) {
           
           view?.showIndicator()
        registerInteractor.register(email:email , password:password , name:name , phoneNumber:phoneNumber , genderId: Int(genderId)!, birthday: birthday){ (result,message,error)  in
               if let error = error {
                   print("errrror\(error)")
                   self.view?.showError(error: error.localizedDescription)
               }else if let message = message{
                
                if !message.phoneNumber!.isEmpty
                {
                    self.view?.showError(error:message.phoneNumber!)
                }else if !message.email!.isEmpty{
                    self.view?.showError(error:message.email!)

                }else if !message.birthday!.isEmpty
                {
                    self.view?.showError(error:message.birthday!)

                }
              

               }
               else {
                   if result != nil{
                       self.user = result!
                       self.view?.resgiterSuccess(user: self.user)
                   }
                   
               }
               
           }
       }
}
