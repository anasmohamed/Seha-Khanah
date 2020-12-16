//
//  SearchViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/15/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var emailBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailBtn.layer.cornerRadius = emailBtn.frame.width / 2

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
