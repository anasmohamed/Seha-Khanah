//
//  VerificationPhoneNumberPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/22/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class VerificationPhoneNumberPresenter {
    private let verificationPhoneNumberInteractor:VerificationPhoneNumberInteractor
    private weak var view: VerificationPhoneNumberProtocol?
    init(view: VerificationPhoneNumberProtocol) {
        self.view = view
        self.verificationPhoneNumberInteractor = VerificationPhoneNumberInteractor()
    }
    
    func verifyPhoneNumber(phoneNumber:String,userType:String) {
        
        view?.showIndicator()
        verificationPhoneNumberInteractor.verifyPhoneNumber(phoneNumber:phoneNumber , userType: userType){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
                
            } else {
                if result != nil{
                    if Int(result!) == 200{
                        self.view?.sendMessageSuccuess(message: "SMS send successfully")
                    }else{
                        self.view?.showError(error: "Somthing Wrong Happend".localized)
                        
                    }
                }
                
            }
            
        }
    }
    func verifyUser(phoneNumber:String,userType:String,code:Int) {
        
        view?.showIndicator()
        verificationPhoneNumberInteractor.verifyUser(phoneNumber:phoneNumber , userType: userType,code:code){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
                
            } else {
                if result != nil{
                    if Int(result!) == 200{
                        self.view?.sendMessageSuccuess(message: "SMS send successfully")
                    }else{
                        self.view?.showError(error: "Somthing Wrong Happend".localized)
                        
                    }
                }
                
            }
            
        }
    }
}
