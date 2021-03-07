//
//  ForgetPasswordViewController.swift
//  Seha Khanah
//
//  Created by Anas on 2/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Toast_Swift
class ForgetPasswordViewController: UIViewController,ForgetPasswordProtocol {
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var resetPasswordBtn: UIButton!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var forgetPasswordView: UIView!
    
    var presenter : ForgetPasswordPresenter!
    var phone : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadiusAndShodow(view:forgetPasswordView)
        presenter = ForgetPasswordPresenter(view: self)
        self.navigationItem.title = "reset password".localized
        setupToolbar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPasswordBtnDidTapped(_ sender: Any) {
        if phoneNumberTextField.text!.isEmpty{
            self.view.makeToast("Enter Missing Data".localized, duration: 3.0, position: .bottom)
            
        }else{
            phone = "+964" + phoneNumberTextField.text!
            presenter.resetPassword(phone: phone , userType:"client")
        }
        
    }
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 5
    }
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
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
        phoneNumberTextField.inputAccessoryView = bar
    }
    @objc func dismissKeyboard() {
           //Causes the view (or one of its embedded text fields) to resign the first responder status.
           view.endEditing(true)
       }
    func getMessageSuccess(user: User) {
        indicator.stopAnimating()
        self.view.makeToast("SMS send successfully".localized, duration: 3.0, position: .bottom)
        let storyboard = UIStoryboard.init(name: "Verification", bundle: nil)
               let verificationPhoneNumberViewConroller = storyboard.instantiateViewController(withIdentifier: "VerificationPhoneNumberViewController") as! VerificationPhoneNumberViewController
        verificationPhoneNumberViewConroller.phoneNumber = user.phoneNumber
        verificationPhoneNumberViewConroller.email = user.phoneNumber
        verificationPhoneNumberViewConroller.isForgetPassword = true
        self.navigationController?.pushViewController(verificationPhoneNumberViewConroller, animated: true)
        
    }
    
    func showError(error: String) {
         self.view.makeToast(error.localized, duration: 3.0, position: .bottom)
        indicator.stopAnimating()
    }
    
    func showNoDataFoundImage() {
        indicator.stopAnimating()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
