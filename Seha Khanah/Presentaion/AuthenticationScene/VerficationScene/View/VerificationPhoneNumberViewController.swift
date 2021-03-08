//
//  VerificationPhoneNumberViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/22/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Toast_Swift
class VerificationPhoneNumberViewController: UIViewController ,VerificationPhoneNumberProtocol{
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var confirmationCodeTextField: UITextField!
    var presenter : VerificationPhoneNumberPresenter!
    var phoneNumber : String?
    var email : String?
    var isForgetPassword = false
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = VerificationPhoneNumberPresenter(view: self)
        presenter.verifyPhoneNumber(phoneNumber: phoneNumber!, userType:"client")
        self.navigationItem.title = "Verify".localized
        setupToolbar()
        // Do any additional setup after loading the view.
    }
    @IBAction func sendConfirmationCodeBtnDidTapped(_ sender: Any) {
                guard let confirmationCode = confirmationCodeTextField.text else {
                    return
                }
                if !confirmationCode.isEmpty{
                    if isForgetPassword{
                        presenter.verifyPassword(phoneNumber: phoneNumber ?? "", userType:"client" ,code:Int(confirmationCode)!)
                    }else{
                        presenter.verifyUser(phoneNumber: phoneNumber ?? "" , userType:"client" ,code:Int(confirmationCode)!)
                    }
        
                }else{
                    self.view.makeToast("Enter Missing Data".localized, duration: 3.0, position: .bottom)
        
                }
        
    }
    
    @IBAction func tryAgainBtnDidTapped(_ sender: Any) {
        presenter.verifyPhoneNumber(phoneNumber: phoneNumber!, userType:"client")
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func sendMessageSuccuess(message: String) {
        indicator.stopAnimating()
        
        self.view.makeToast(message.localized, duration: 3.0, position: .bottom)

        print(message)
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
        self.view.makeToast(error, duration: 3.0, position: .bottom)
        
    }
    func setupToolbar(){
        //Create a toolbar
        let bar = UIToolbar()
        
        //Create a done button with an action to trigger our function to dismiss the keyboard
     let doneBtn = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(dismissKeyboard))
        
        //Create a felxible space item so that we can add it around in toolbar to position our done button
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Add the created button items in the toobar
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        
        //Add the toolbar to our textfield
        confirmationCodeTextField.inputAccessoryView = bar
    }
    @objc func dismissKeyboard() {
           //Causes the view (or one of its embedded text fields) to resign the first responder status.
           view.endEditing(true)
       }
    func verifyUserSuccuess(message: String) {
        indicator.stopAnimating()
        if isForgetPassword
        {
            let storyboard = UIStoryboard.init(name: "ResetForgetPassword", bundle: nil)
            let resetForgetPasswordViewController = storyboard.instantiateViewController(withIdentifier: "ResetForgetPasswordViewController") as! ResetForgetPasswordViewController
            resetForgetPasswordViewController.token = message
            resetForgetPasswordViewController.email = email!
            
            self.navigationController!.pushViewController(resetForgetPasswordViewController, animated: true)
            
        }else{
            UserDefaults.standard.set(true, forKey: "isUserLoggedin")
            let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
            let verificationPhoneNumberViewConroller = storyboard.instantiateViewController(withIdentifier: "TabBar")
            verificationPhoneNumberViewConroller.modalPresentationStyle = .fullScreen
            self.present(verificationPhoneNumberViewConroller, animated: true)
        }
        
    }
    
    
    
    
}
