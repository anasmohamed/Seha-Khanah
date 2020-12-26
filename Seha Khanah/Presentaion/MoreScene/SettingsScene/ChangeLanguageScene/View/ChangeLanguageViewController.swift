//
//  ChangeLanguageViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import MBRadioCheckboxButton
import MOLH

class ChangeLanguageViewController: UIViewController {
    
    @IBOutlet weak var choosenLangeuageLbl: UILabel!
    
    @IBOutlet weak var chosenLanguageView: UIView!
    
    @IBOutlet weak var arabicRadioButton: RadioButton!
    @IBOutlet weak var englishRadioButton: RadioButton!
    @IBOutlet weak var saveBtn: UIButton!
    var languageBtnsGroup = RadioButtonContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = 10
        
        // corner radius
        chosenLanguageView.layer.cornerRadius = 10
        
        // border
        chosenLanguageView.layer.borderWidth = 1.0
        chosenLanguageView.layer.borderColor = UIColor.black.cgColor
        
        // shadow
        chosenLanguageView.layer.shadowColor = UIColor.black.cgColor
        chosenLanguageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        chosenLanguageView.layer.shadowOpacity = 0.7
        chosenLanguageView.layer.shadowRadius = 4.0
        setupLanguageBtns()
        // Do any additional setup after loading the view.
    }
    func setupLanguageBtns() {
        languageBtnsGroup.addButtons([englishRadioButton, arabicRadioButton])
        languageBtnsGroup.delegate = self
        
        languageBtnsGroup.selectedButtons = [englishRadioButton]
        englishRadioButton.style = .square
        arabicRadioButton.style = .square
       
    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        
        let languageString  = choosenLangeuageLbl.text == "English" ? "en" : "ar"
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == languageString ? "ar" : "en")
        MOLH.reset(transition: .transitionCrossDissolve)
    }
 
}
extension ChangeLanguageViewController: RadioButtonDelegate {
    func radioButtonDidSelect(_ button: RadioButton) {
        choosenLangeuageLbl.text = button.title(for: .normal)!
        print("Select: ", button.title(for: .normal)!)
        
    }
    
    func radioButtonDidDeselect(_ button: RadioButton) {
        print("Deselect: ", button.title(for: .normal)!)
        
    }
    
    
    
    
}
