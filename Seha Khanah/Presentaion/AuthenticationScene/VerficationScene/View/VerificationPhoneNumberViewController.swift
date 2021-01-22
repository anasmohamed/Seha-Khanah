//
//  VerificationPhoneNumberViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/22/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class VerificationPhoneNumberViewController: UIViewController ,VerificationPhoneNumberProtocol{
    
    
    @IBOutlet weak var confirmationCodeTextField: UITextField!
    var presenter : VerificationPhoneNumberPresenter!
    var phoneNumber : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = VerificationPhoneNumberPresenter(view: self)
        presenter.verifyPhoneNumber(phoneNumber: phoneNumber!, userType:"client")
        
        // Do any additional setup after loading the view.
    }
    @IBAction func sendConfirmationCodeBtnDidTapped(_ sender: Any) {
        guard let confirmationCode = confirmationCodeTextField.text else {
            return
        }
    }
    
    @IBAction func tryAgainBtnDidTapped(_ sender: Any) {
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func sendMessageSuccuess(message: String) {
        print(message)
    }
    
    func showError(error: String) {
        
    }
    
    
}
