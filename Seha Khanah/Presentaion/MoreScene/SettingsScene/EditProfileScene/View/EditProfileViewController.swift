//
//  EditProfileViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/11/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MBRadioCheckboxButton
class EditProfileViewController: UIViewController {
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    @IBOutlet weak var femaleRadioBtn: RadioButton!
    @IBOutlet weak var maleRadioBtn: RadioButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var fullNameTExtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveEditesBtnDidTapped(_ sender: Any) {
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
