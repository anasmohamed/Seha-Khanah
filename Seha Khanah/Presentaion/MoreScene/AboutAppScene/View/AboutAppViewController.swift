//
//  AboutAppViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class AboutAppViewController: UIViewController,AboutAppProtocol {
    
    
    
    @IBOutlet weak var aboutAppLbl: UILabel!
    
    
    var aboutAppPresenter : AboutAppPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "About the App".localized

        aboutAppPresenter = AboutAppPresenter(view:self)
        aboutAppPresenter.getAboutApp()
        // Do any additional setup after loading the view.
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func aboutAppResults() {
        aboutAppLbl.text = aboutAppPresenter.getAboutAppText()
        
    }
    
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    
    
}
