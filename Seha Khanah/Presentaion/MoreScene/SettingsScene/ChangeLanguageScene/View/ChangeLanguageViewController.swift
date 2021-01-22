//
//  ChangeLanguageViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import Localize
import MBRadioCheckboxButton

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
        self.navigationItem.title = "Change Language".localized
              

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
    
        Localize.update(language: "ar")
//       if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
//            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
//            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//        } else {
//            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//        }
//
//        MOLH.setLanguageTo(LocalizationSystem.sharedInstance.getLanguage())
//        MOLH.reset()
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
