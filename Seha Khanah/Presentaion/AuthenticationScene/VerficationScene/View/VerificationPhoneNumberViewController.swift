//
//  VerificationPhoneNumberViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/22/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class VerificationPhoneNumberViewController: UIViewController ,VerificationPhoneNumberProtocol{
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
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
        presenter.verifyUser(phoneNumber: phoneNumber!, userType:"client" ,code:Int(confirmationCode)!)
    }
    
    @IBAction func tryAgainBtnDidTapped(_ sender: Any) {
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.startAnimating()
    }
    
    func sendMessageSuccuess(message: String) {
        indicator.stopAnimating()
        
        
        print(message)
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
        
    }
    func verifyUserSuccuess(message: String) {
        indicator.stopAnimating()

        UserDefaults.standard.set(true, forKey: "isUserLoggedin")
        let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
        let verificationPhoneNumberViewConroller = storyboard.instantiateViewController(withIdentifier: "TabBar")
        self.present(verificationPhoneNumberViewConroller, animated: true,completion: nil)
    }
    
    
    
    
}
