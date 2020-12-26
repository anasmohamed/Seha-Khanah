//
//  ChangeLanguageViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import MBRadioCheckboxButton
class ChangeLanguageViewController: UIViewController {
    
    
    @IBOutlet weak var chosenLanguageView: UIView!
    @IBOutlet weak var arabicCheckBox: CheckboxButton!
    @IBOutlet weak var englishCheckBox: CheckboxButton!
    @IBOutlet weak var saveBtn: UIButton!
    var languageBtnsGroup = CheckboxButtonContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func setupLanguageBtns() {
        languageBtnsGroup.addButtons([englishCheckBox, arabicCheckBox])
        languageBtnsGroup.delegate = self
        
        languageBtnsGroup.selectedButtons = [englishCheckBox]
        
        // set style, color and border for option A
//        optionAG3.style = .square
//        optionAG3.checkBoxColor = CheckBoxColor(activeColor: UIColor.clear, inactiveColor: UIColor.red, inactiveBorderColor: UIColor.red, checkMarkColor: UIColor.magenta)
//        optionAG3.checkboxLine = CheckboxLineStyle(checkBoxHeight: 25)
//
//        // set style, color for option B
//        optionBG3.style = .circle
//        optionBG3.checkBoxColor = CheckBoxColor(activeColor: UIColor.brown, inactiveColor: UIColor.yellow, inactiveBorderColor: UIColor.blue, checkMarkColor: UIColor.black)
//
//        // set border for option C
//        optionCG3.checkboxLine = CheckboxLineStyle(checkBoxHeight: 35, checkmarkLineWidth: 7, padding: 15)
//        optionCG3.checkBoxColor = CheckBoxColor(activeColor: UIColor.white, inactiveColor: UIColor.white, inactiveBorderColor: UIColor.white, checkMarkColor: optionCG3.tintColor)
    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
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
extension ChangeLanguageViewController: CheckboxButtonDelegate {
    
    func chechboxButtonDidSelect(_ button: CheckboxButton) {
        print("Select: ", button.title(for: .normal)!)
    }
    
    func chechboxButtonDidDeselect(_ button: CheckboxButton) {
        print("Deselect: ", button.title(for: .normal)!)
    }
    
    
}
