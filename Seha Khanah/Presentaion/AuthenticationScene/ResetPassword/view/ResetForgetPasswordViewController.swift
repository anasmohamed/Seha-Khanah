//
//  ResetPasswordViewController.swift
//  Seha Khanah
//
//  Created by Anas on 2/16/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Toast_Swift
class ResetForgetPasswordViewController: UIViewController,ResetForgetPasswordProtocol {
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var resetForgetPasswordView: UIView!
    
    var token : String = ""
    var email : String = ""
    var presenter : ResetForgetPasswordPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ResetForgetPasswordPresenter(view: self)
        presenter.verifyResetPasswordToken(token: token)
        self.navigationItem.title = "reset password".localized
        setupToolbar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitNewPasswordBtnDidTapped(_ sender: Any) {
        if !newPasswordTextField.text!.isEmpty && !confirmPasswordTextField.text!.isEmpty
        {
            if confirmPasswordTextField.text == newPasswordTextField.text!
            {
                presenter.resetPassword(email: email, userType: "client", token: token, password:newPasswordTextField.text! , confirmPassword: confirmPasswordTextField.text!)
            }else{
                self.view.makeToast("Passwords Didn't Match".localized)
            }
            
        }else{
            self.view.makeToast("Enter Missing Data".localized)

        }
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func resetPasswordSuccess(user: User) {
        indicator.stopAnimating()
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
           let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

           let navigationController = UINavigationController.init(rootViewController: loginViewController)
        
           navigationController.modalPresentationStyle = .fullScreen

           self.present(navigationController, animated: true, completion: nil)
    }
    func setupToolbar(){
        //Create a toolbar
        let bar = UIToolbar()
        
        //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(dismissMyKeyboard))
        
        //Create a felxible space item so that we can add it around in toolbar to position our done button
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Add the created button items in the toobar
        bar.items = [flexSpace, flexSpace, doneBtn]
        bar.sizeToFit()
        
        //Add the toolbar to our textfield
      
        newPasswordTextField.inputAccessoryView = bar
        confirmPasswordTextField.inputAccessoryView = bar
    }
    @objc func dismissMyKeyboard(){
         view.endEditing(true)
     }
    func showError(error: String) {
        indicator.stopAnimating()
        
    }
    
    func showNoDataFoundImage() {
        indicator.stopAnimating()
        
    }
    
    func verifyTokenSuccess(message: String) {
        indicator.stopAnimating()
        
    }
    
}
