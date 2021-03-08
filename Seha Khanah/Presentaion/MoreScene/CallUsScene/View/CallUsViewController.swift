//
//  CallUsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class CallUsViewController: UIViewController ,UITextViewDelegate{
    
    @IBOutlet weak var messageTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Call US".localized
        messageTextView.delegate = self
        messageTextView!.layer.borderWidth = 1
        messageTextView.layer.cornerRadius = 5
        messageTextView!.layer.borderColor = UIColor.gray.cgColor
        messageTextView.text = "Add Message".localized
        messageTextView.textColor = UIColor.lightGray
        setupToolbar()
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if messageTextView.textColor == UIColor.lightGray
        {
            messageTextView.text = nil
            messageTextView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if messageTextView.text.isEmpty {
            messageTextView.text = "Add Message".localized
            
            messageTextView.textColor = UIColor.lightGray
        }
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
           messageTextView.inputAccessoryView = bar
          
           
       }
       
       @objc func dismissMyKeyboard(){
           view.endEditing(true)
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
