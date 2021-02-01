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
class RegisterViewController: UIViewController,RegisterProtocol {
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
      
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
        
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
        self.view.makeToast(error, duration: 3.0, position: .top)
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
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        guard  let email = emailTextField.text, let password = passwordTextField.text, let userName = userNameTextField.text,let phone = phoneTextField.text else {
            return
        }
        //        guard phone.count == 11 else {
        //            return
        //        }
        guard password.count > 6 else {
            self.view.makeToast("Please Enter Password More Than 6 character", duration: 3.0, position: .top)
            
            return
        }
       
        if dateTextField.text!.isEmpty {
            self.view.makeToast("Please Enter Password More Than 6 character", duration: 3.0, position: .bottom)
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
