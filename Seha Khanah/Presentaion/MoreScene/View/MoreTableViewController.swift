//
//  MoreTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    var settingsTitles = ["Settings".localized,"Call US".localized,"About the App".localized,"How The App Works".localized,"Login".localized]
    var settingsImages = ["gear","phone-26","ask-question","undo","exit"]
    var isUserLoggedIn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "More".localized
        setupTableView()
        isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        
    }
    
    // MARK: - Table view data source
    func setupTableView() {
        tableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreTableViewCell")
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        if indexPath.row != 4{
            cell.accessoryType = .disclosureIndicator
        }
        cell.titleLbl.text = settingsTitles[indexPath.row]
        if indexPath.row == 4 && isUserLoggedIn
        {
            cell.titleLbl.text = "Log out".localized
        }
        
        cell.iconImageView.image = UIImage(named:settingsImages[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let settingsTableViewController = UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsTableViewController") as! SettingsTableViewController
            self.navigationController!.pushViewController(settingsTableViewController, animated: true)
        case 1:
            let settingsTableViewController = UIStoryboard.init(name: "CallUs", bundle: nil).instantiateViewController(withIdentifier: "CallUsViewController") as! CallUsViewController
            self.navigationController!.pushViewController(settingsTableViewController, animated: true)
            
            
        case 2:
            let aboutAppViewController = UIStoryboard.init(name: "AboutApp", bundle: nil).instantiateViewController(withIdentifier: "AboutAppViewController") as! AboutAppViewController
            self.navigationController!.pushViewController(aboutAppViewController, animated: true)
        case 3:
            let howTheAppWorksViewController = UIStoryboard.init(name: "HowTheAppWorks", bundle: nil).instantiateViewController(withIdentifier: "HowTheAppWorksViewController") as! HowTheAppWorksViewController
            self.navigationController!.pushViewController(howTheAppWorksViewController, animated: true)
        case 4:
            let logoutSliderViewController = UIStoryboard.init(name: "Slider", bundle: nil).instantiateViewController(withIdentifier: "LogoutSliderViewController") as! LogoutSliderViewController
            logoutSliderViewController.modalPresentationStyle = .fullScreen

            self.present(logoutSliderViewController, animated: true)
            
            UserDefaults.standard.removeObject(forKey: "isUserLoggedin")
            UserDefaults.standard.removeObject(forKey: "email")
            UserDefaults.standard.removeObject(forKey: "birthday")
            UserDefaults.standard.removeObject(forKey: "genderId")
            UserDefaults.standard.removeObject(forKey: "id")
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "phoneNumber")
            UserDefaults.standard.removeObject(forKey: "token")
            
        default:
            break
        }
    }
    
    
    
}
