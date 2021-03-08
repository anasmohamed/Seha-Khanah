//
//  EditProfileViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/11/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MBRadioCheckboxButton
class EditProfileViewController: UIViewController ,EditUserProfileProtocol,UITextFieldDelegate{
    
    
    let datePicker = UIDatePicker()
    let genderRadioBtnsGroup = RadioButtonContainer()
    var selectedGender = "1"
    var finalPhoneNumber = ""
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var femaleRadioBtn: RadioButton!
    @IBOutlet weak var maleRadioBtn: RadioButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var fullNameTExtField: UITextField!
    var editProfilePresenter : EditUserProfilePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfilePresenter = EditUserProfilePresenter(view: self)
        createDatePicker()
        setupLanguageBtns()
        
        dateOfBirthTextField.text = UserDefaults.standard.string(forKey: "birthday")
        fullNameTExtField.text = UserDefaults.standard.string(forKey: "name")
        emailTextField.text = UserDefaults.standard.string(forKey: "email")
        mobileNumberTextField.text = UserDefaults.standard.string(forKey:"phoneNumber")
        selectedGender = UserDefaults.standard.string(forKey:"genderId" )!
        setupToolbar()
        mobileNumberTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveEditesBtnDidTapped(_ sender: Any) {
        guard  let email = emailTextField.text, let userName = fullNameTExtField.text,var phone = mobileNumberTextField.text,let birthday = dateOfBirthTextField.text  else {
            return
        }
       if !phone.isEmpty{
        phone = String(phone.suffix(10))
        print("phone \(phone)")
        finalPhoneNumber = "+964" + phone
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:birthday)!
        print(date)
        editProfilePresenter.editUserProfile(email: email, name: userName, phoneNumber: finalPhoneNumber, genderId: selectedGender, birthday: date)
    }
    func showError(error: String) {
        indicator.stopAnimating()
        print("error message\(error)")
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        dateOfBirthTextField.inputAccessoryView = toolBar
        dateOfBirthTextField.inputView = datePicker
        datePicker.locale = Locale(identifier: "en_US")

        datePicker.datePickerMode = .date
    }
    func setupLanguageBtns() {
        genderRadioBtnsGroup.addButtons([maleRadioBtn, femaleRadioBtn])
        genderRadioBtnsGroup.delegate = self
        if selectedGender == "1" {
            genderRadioBtnsGroup.selectedButtons = [maleRadioBtn]
            
        }else{
            genderRadioBtnsGroup.selectedButtons = [femaleRadioBtn]
            
        }
        maleRadioBtn.style = .circle
        femaleRadioBtn.style = .circle
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
       
        if textField == mobileNumberTextField {
            let numberStr: String = string
            let formatter: NumberFormatter = NumberFormatter()
            formatter.locale = Locale(identifier: "EN")
            if let final = formatter.number(from: numberStr) {
                textField.text =  "\(textField.text ?? "")\(final)"
            }
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            
            if (isBackSpace == -92) {
                print("Backspace was pressed")
                return true
            }
            return false
        }
        return true
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
        mobileNumberTextField.inputAccessoryView = bar
        emailTextField.inputAccessoryView = bar
        fullNameTExtField.inputAccessoryView  = bar
        
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    @objc func doneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.startAnimating()
    }
    
    func editProfileSuccess(user: User) {
        indicator.stopAnimating()
        let storyboard = UIStoryboard.init(name: "Search", bundle: nil)
        let tabBarViewController = storyboard.instantiateViewController(withIdentifier: "TabBar")
        tabBarViewController.modalPresentationStyle = .fullScreen
        self.present(tabBarViewController, animated: true, completion: nil)
    }
    
    
}
extension EditProfileViewController: RadioButtonDelegate {
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
