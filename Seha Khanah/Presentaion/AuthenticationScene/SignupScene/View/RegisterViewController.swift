//
//  RegisterViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/14/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import UIKit
class RegisterViewController: UIViewController {
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
       
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

