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
class RegisterViewController: UIViewController,RegisterProtocol {
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var femaleRadioBtn: RadioButton!
    @IBOutlet weak var maleRadioBtn: RadioButton!
    let genderRadioBtnsGroup = RadioButtonContainer()
    var selectedGender = "1"
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
            phoneTextField.setIcon(UIImage(named: "phone")!)
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField!
        {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "email")!)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
        {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "lock")!)
        }
    }
    
    @IBOutlet weak var dateTextField: UITextField!
        {
        didSet {
            dateTextField.tintColor = UIColor.lightGray
            dateTextField.setIcon(UIImage(named: "calendar")!)
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
        
    }
    
    func hideIndicator() {
        
    }
    
    func resgiterSuccess(user: User) {
        
    }
    
    func showError(error: String) {
        
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePicker
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
        
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func registerBtnDidTapped(_ sender: Any) {
        guard  let email = emailTextField.text, let password = passwordTextField.text, let userName = userNameTextField.text,let phone = phoneTextField.text,let bithday = dateTextField.text  else {
            return
        }
        guard phone.count == 11 else {
            return
        }
        guard password.count > 6 else {
            return
        }
            
        registerPresenter.register(email: email, password: password, name: userName, phoneNumber: phone, genderId: selectedGender, birthday: bithday)
        
    }
    
}

extension RegisterViewController: RadioButtonDelegate {
    func radioButtonDidSelect(_ button: RadioButton) {
        if button.titleLabel?.text == "male" || button.titleLabel?.text == ""
        {
            selectedGender = "1"
            
        }else{
            selectedGender = "2"
        }
    }
    
    func radioButtonDidDeselect(_ button: RadioButton) {
        
    }
    
    
    
    
    
}
