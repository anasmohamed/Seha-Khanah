//
//  RegisterViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/14/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import UIKit
import MBRadioCheckboxButton
import Toast_Swift
class RegisterViewController: UIViewController,RegisterProtocol,UITextFieldDelegate {
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var femaleRadioBtn: RadioButton!
    @IBOutlet weak var maleRadioBtn: RadioButton!
    let genderRadioBtnsGroup = RadioButtonContainer()
    var selectedGender = "1"
    var date : Date? = nil
    @IBOutlet weak var userNameTextField: UITextField!
        {
        didSet {
            userNameTextField.tintColor = UIColor.lightGray
            userNameTextField.setIcon(UIImage(named: "user")!)
        }
    }
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
        {
        didSet {
            confirmPasswordTextField.tintColor = UIColor.lightGray
            confirmPasswordTextField.setIcon(UIImage(named: "padlock-3")!)
        }
    }
    @IBOutlet weak var phoneTextField: UITextField!
        {
        didSet {
            phoneTextField.tintColor = UIColor.lightGray
            phoneTextField.setIcon(UIImage(named: "phone-call-2")!)
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField!
        {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "email-6")!)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
        {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "padlock-3")!)
        }
    }
    
    @IBOutlet weak var dateTextField: UITextField!
        {
        didSet {
            dateTextField.tintColor = UIColor.lightGray
            dateTextField.setIcon(UIImage(named: "calendar-2")!)
        }
    }
    
    var registerPresenter:RegisterPresenter!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerPresenter = RegisterPresenter(view: self)
        createDatePicker()
        setupLanguageBtns()
        phoneTextField.delegate = self
        setupToolbar()
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == phoneTextField {
            let numberStr: String = string
            let formatter: NumberFormatter = NumberFormatter()
            formatter.locale = Locale(identifier: "EN")
            if let final = formatter.number(from: numberStr) {
                textField.text =  "\(textField.text ?? "")\(final)"
            }
            return false
        }
        return true
    }
    func resgiterSuccess(user: User) {
        indicator.stopAnimating()
        
        let storyboard = UIStoryboard.init(name: "Verification", bundle: nil)
        let verificationPhoneNumberViewConroller = storyboard.instantiateViewController(withIdentifier: "VerificationPhoneNumberViewController") as! VerificationPhoneNumberViewController
        verificationPhoneNumberViewConroller.phoneNumber = phoneTextField.text
        self.navigationController?.pushViewController(verificationPhoneNumberViewConroller, animated: true)
        UserDefaults.standard.set(user.email, forKey: "email")
        UserDefaults.standard.set(user.birthday, forKey: "birthday")
        UserDefaults.standard.set(user.genderId, forKey: "genderId")
        UserDefaults.standard.set(user.id, forKey: "id")
        UserDefaults.standard.set(user.name, forKey: "name")
        UserDefaults.standard.set(user.phoneNumber, forKey: "phoneNumber")
        UserDefaults.standard.set(user.token, forKey: "token")
        
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
        print("error message\(error)")
        self.view.makeToast(error.localized, duration: 3.0, position: .top)
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePicker
        datePicker.locale = Locale(identifier: "en_US")
        
        datePicker.datePickerMode = .date
    }
    func setupLanguageBtns() {
        genderRadioBtnsGroup.addButtons([maleRadioBtn, femaleRadioBtn])
        genderRadioBtnsGroup.delegate = self
        
        genderRadioBtnsGroup.selectedButtons = [maleRadioBtn]
        maleRadioBtn.style = .circle
        femaleRadioBtn.style = .circle
        
    }
    @objc func doneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        date = datePicker.date
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
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
        phoneTextField.inputAccessoryView = bar
        passwordTextField.inputAccessoryView = bar
        emailTextField.inputAccessoryView = bar
        userNameTextField.inputAccessoryView  = bar
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        guard  let email = emailTextField.text, let password = passwordTextField.text,let confrimPassword = confirmPasswordTextField.text, let userName = userNameTextField.text,var phone = phoneTextField.text else {
            return
        }
        phone = "+" + phone
        //        guard phone.count == 11 else {
        //            return
        //        }
        guard password.count > 6 else {
            self.view.makeToast("Please Enter Password More Than 6 character".localized, duration: 3.0, position: .bottom)
            
            return
        }
        guard confrimPassword == password else {
            self.view.makeToast("Passwords Didn't Match".localized, duration: 3.0, position: .bottom)
            
            return
        }
        if dateTextField.text!.isEmpty {
            self.view.makeToast("Please Enter Date".localized, duration: 3.0, position: .bottom)
            return
        }else{
            registerPresenter.register(email: email, password: password, name: userName, phoneNumber: phone, genderId: selectedGender, birthday: date!)
            
        }
        
    }
    
}

extension RegisterViewController: RadioButtonDelegate {
    func radioButtonDidSelect(_ button: RadioButton) {
        if button.titleLabel?.text == "Male" || button.titleLabel?.text == "ذكر"
        {
            selectedGender = "1"
            
        }else{
            selectedGender = "2"
        }
    }
    
    func radioButtonDidDeselect(_ button: RadioButton) {
        
    }
    
    
    
    
    
}
