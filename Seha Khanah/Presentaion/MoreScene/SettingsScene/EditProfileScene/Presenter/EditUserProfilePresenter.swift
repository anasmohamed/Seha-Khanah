//
//  EditUserProfilePresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/11/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class EditUserProfilePresenter {
    private let editUserProfileInteractor:EditUserProfileInteractor
    private var user:User
    private weak var view: EditUserProfileProtocol?
    init(view: EditUserProfileProtocol) {
        self.view = view
        self.editUserProfileInteractor = EditUserProfileInteractor()
        user = User()
    }
    
    func editUserProfile(email:String,name:String,phoneNumber:String,genderId:String,birthday:String) {
        
        view?.showIndicator()
        editUserProfileInteractor.updateUserProfile(email:email , name:name , phoneNumber:phoneNumber , genderId: Int(genderId)!, birthday: birthday){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.user = result!
                    self.view?.editProfileSuccess(user: self.user)
                }
                
            }
            
        }
    }
}


