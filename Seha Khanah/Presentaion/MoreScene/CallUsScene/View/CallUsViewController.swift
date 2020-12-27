//
//  CallUsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class CallUsViewController: UIViewController {

    @IBOutlet weak var messageTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextView!.layer.borderWidth = 1
        messageTextView.layer.cornerRadius = 5
        messageTextView!.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
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
