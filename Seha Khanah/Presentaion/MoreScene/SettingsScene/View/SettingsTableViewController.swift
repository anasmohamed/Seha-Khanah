//
//  SettingsTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/26/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    var cellTitlesWithRegisterdUser = ["Edit Profile".localized
        ,"Edit Your Password".localized
        ,"Change Language".localized
    ]
    var cellTitles = ["Change Language".localized]
    var cellImagesWithRegisterdUser = ["user","lock","changelanguage"]
    var cellImages = ["changelanguage"]
    
    var isUserLoggedIn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings".localized
        isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        setupTableView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func setupTableView() {
        tableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoreTableViewCell")
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isUserLoggedIn{
            return cellTitlesWithRegisterdUser.count
        }
        return cellTitles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        cell.accessoryType = .disclosureIndicator
        if isUserLoggedIn {
            cell.titleLbl?.text = cellTitlesWithRegisterdUser[indexPath.row]
            cell.iconImageView?.image = UIImage(named:cellImagesWithRegisterdUser[indexPath.row])
        }else{
            cell.titleLbl?.text = cellTitles[indexPath.row]
            cell.iconImageView?.image = UIImage(named:cellImages[indexPath.row])
            
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isUserLoggedIn{
            switch indexPath.row {
            case 0:
                let languageChangeViewController = UIStoryboard.init(name: "EditProfile", bundle: nil).instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
                self.navigationController!.pushViewController(languageChangeViewController, animated: true)
                
            case 1:
                let languageChangeViewController = UIStoryboard.init(name: "ResetPassword", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
                self.navigationController!.pushViewController(languageChangeViewController, animated: true)
            case 2:
                
                let languageChangeViewController = UIStoryboard.init(name: "ChangeLanguage", bundle: nil).instantiateViewController(withIdentifier: "ChangeLanguageViewController") as! ChangeLanguageViewController
                self.navigationController!.pushViewController(languageChangeViewController, animated: true)
            default:
                break
            }
        }else{
            switch indexPath.row {
            case 0:
               let languageChangeViewController = UIStoryboard.init(name: "ChangeLanguage", bundle: nil).instantiateViewController(withIdentifier: "ChangeLanguageViewController") as! ChangeLanguageViewController
                              self.navigationController!.pushViewController(languageChangeViewController, animated: true)
                
                
            default:
                break;
            }
        }
        if indexPath.row == 0{
            
            
        }
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
