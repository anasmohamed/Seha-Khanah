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
        
        cell.textLabel!.text = settingsTitles[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let settingsTableViewController = UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsTableViewController") as! SettingsTableViewController
            self.navigationController!.pushViewController(settingsTableViewController, animated: true)
        case 1:
            let settingsTableViewController = UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsTableViewController") as! SettingsTableViewController
            self.navigationController!.pushViewController(settingsTableViewController, animated: true)
            
            
        case 2:
            let searchForPharmaciesViewController = storyboard?.instantiateViewController(withIdentifier: "SearchForPharmaciesViewController") as! SearchForPharmaciesViewController
            self.navigationController!.pushViewController(searchForPharmaciesViewController, animated: true)
        case 3:
            let searchForPharmaciesViewController = storyboard?.instantiateViewController(withIdentifier: "SearchForPharmaciesViewController") as! SearchForPharmaciesViewController
            self.navigationController!.pushViewController(searchForPharmaciesViewController, animated: true)
        case 4:
            let searchForPharmaciesViewController = storyboard?.instantiateViewController(withIdentifier: "SearchForPharmaciesViewController") as! SearchForPharmaciesViewController
            self.navigationController!.pushViewController(searchForPharmaciesViewController, animated: true)
        default:
            break
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
