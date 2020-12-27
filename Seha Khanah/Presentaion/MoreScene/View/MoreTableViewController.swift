//
//  MoreTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    var settingsTitles = ["Settings","Call US","About the App","How The App Works","Login"]
    var settingsImages = ["gear","","","",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath)
        if indexPath.row != 4{
            cell.accessoryType = .disclosureIndicator
        }
        cell.textLabel!.text = settingsTitles[indexPath.row]
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
            let aboutAppViewController = UIStoryboard.init(name: "AboutApp", bundle: nil).instantiateViewController(withIdentifier: "AboutAppViewController") as! AboutAppViewController
            self.navigationController!.pushViewController(aboutAppViewController, animated: true)
        default:
            break
        }
    }
    
    
    
}
