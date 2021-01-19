//
//  OffersForSpcificCategoryTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/19/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class OffersForSpcificCategoryTableViewController: UITableViewController,OffersForSpcificCategoryProtocol {
 
    
    
    var presenter : OffersForSpcificCategoryPresenter!
    var id :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OffersForSpcificCategoryPresenter(view:self)
        presenter.getOffersForSpcificCategory(id: id!)
        setupTableView() 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func setupTableView() {
           tableView.register(UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil), forCellReuseIdentifier: "MostOrderedOffersTableViewCell")
           
       }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.getOffersForSpcificCategoryCount()
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostOrderedOffersTableViewCell", for: indexPath) as! MostOrderedOffersTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)


        return cell
    }
    
    func showIndicator() {
         
     }
     
     func hideIndicator() {
         
     }
     
     func getOffersForSpcificCategorySuccess() {
        tableView.reloadData()
     }
     
     func showError(error: String) {
         
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