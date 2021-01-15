//
//  FavoirteContainerViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class FavoirteContainerViewController: UIViewController {
   
     @IBOutlet weak var segmentCotrol: UISegmentedControl!
     @IBOutlet weak var favoriteDoctorsView: UIView!
     var isUserLoggedIn = false
     @IBOutlet weak var favoriteOffersView: UIView!
     let locale = NSLocale.current.languageCode
     
     override func viewDidLoad() {
         super.viewDidLoad()
         isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
     
         if isUserLoggedIn == true
         {
             
             segmentCotrol.isHidden = false
             
         }else{
             favoriteDoctorsView.alpha = 0
             favoriteOffersView.alpha = 0
             segmentCotrol.isHidden = true
         }
         // Do any additional setup after loading the view.
     }
     
     @IBAction func segmentControllDidTapped(segment:UISegmentedControl)
     {
         
         if segment.selectedSegmentIndex == 0 {
             favoriteDoctorsView.alpha = 0
             favoriteOffersView.alpha = 1
             
         } else {
             favoriteDoctorsView.alpha = 1
             favoriteOffersView.alpha = 0
         }
         
     }

}
