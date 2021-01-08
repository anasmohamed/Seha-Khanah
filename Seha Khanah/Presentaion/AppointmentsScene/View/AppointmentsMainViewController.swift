//
//  AppointmentsMainViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class AppointmentsMainViewController: UIViewController {
    
    @IBOutlet weak var myAppointmentsView: UIView!
    
    @IBOutlet weak var myOffersView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func segmentControllDidTapped(segment:UISegmentedControl)
    {
        if segment.selectedSegmentIndex == 0 {
                   myAppointmentsView.alpha = 1
                   myOffersView.alpha = 0
               } else {
                   myAppointmentsView.alpha = 0
                   myOffersView.alpha = 1
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
