//
//  ForgetPasswordViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController,ResetPasswordProtocol {

    
    @IBOutlet weak var passwordsView: UIView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    var resetPasswordPresenter : ResetPasswordPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetPasswordPresenter = ResetPasswordPresenter(view:self)
        setupToolbar()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: passwordsView)

    }
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 5
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
        newPasswordTextField.inputAccessoryView = bar
        oldPasswordTextField.inputAccessoryView = bar

    }
    @objc func dismissKeyboard() {
           //Causes the view (or one of its embedded text fields) to resign the first responder status.
           view.endEditing(true)
       }
    @IBAction func saveChangesBtnDidTapped(_ sender: Any) {
        guard let oldPassword = oldPasswordTextField.text,let newPassword = newPasswordTextField.text else {
            return
        }
        let email = UserDefaults.standard.string(forKey: "email")
        let userType = UserDefaults.standard.string(forKey: "genderId")
        let token = UserDefaults.standard.string(forKey: "token")
        
        resetPasswordPresenter.resetPassword(email:email!,userType: userType!,token: token!,password: oldPassword,passwordConfirmation: newPassword)
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func resetPasswordSuccess(user: User) {
        
    }
    
    func showError(error: String) {
        
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
