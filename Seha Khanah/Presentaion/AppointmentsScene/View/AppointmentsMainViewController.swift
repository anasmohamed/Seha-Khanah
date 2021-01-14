//
//  AppointmentsMainViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class AppointmentsMainViewController: UIViewController {
    
    @IBOutlet weak var exitArrowImage: UIImageView!
    @IBOutlet weak var noUserLoggedInStackView: UIStackView!
    @IBOutlet weak var segmentCotrol: UISegmentedControl!
    @IBOutlet weak var myAppointmentsView: UIView!
    var isUserLoggedIn = false
    @IBOutlet weak var myOffersView: UIView!
    let locale = NSLocale.current.languageCode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        if locale == "ar"
        {
            exitArrowImage.image = exitArrowImage.image?.flipIfNeeded()
        }
        if isUserLoggedIn == true
        {
            noUserLoggedInStackView.isHidden = true
            segmentCotrol.isHidden = false
            
        }else{
            myAppointmentsView.alpha = 0
            myOffersView.alpha = 0
            segmentCotrol.isHidden = true
            noUserLoggedInStackView.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentControllDidTapped(segment:UISegmentedControl)
    {
        
        if segment.selectedSegmentIndex == 0 {
            myAppointmentsView.alpha = 0
            myOffersView.alpha = 1
            
        } else {
            myAppointmentsView.alpha = 1
            myOffersView.alpha = 0
        }
        
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
