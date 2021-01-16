//
//  MyAppintmentsTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class MyAppintmentsTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MyAppointmentsProtocol {
    @IBOutlet var myAppointmentsTableView: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var myAppointmentsPresenter : MyAppointmentsPresenter!
    var isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Appointments".localized
        myAppointmentsPresenter = MyAppointmentsPresenter(view: self)
        isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        if isUserLoggedIn {
            myAppointmentsPresenter.getMyAppintments()
            setupTableView()
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source
    func setupTableView() {
        tableView.register(UINib(nibName: "MyAppointmentsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAppointmentsTableViewCell")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myAppointmentsPresenter.getMyAppointmentsCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentsTableViewCell", for: indexPath) as! MyAppointmentsTableViewCell
        cell.actionBlock = {
            print(indexPath.row)
            self.myAppointmentsPresenter.cancelBooking(id: cell.bookingId!)
        }
        cell.mapStackViewActionBlock = {
            self.openGoogleMap(lat: cell.lat!, lng: cell.longtiude!)
        }
        myAppointmentsPresenter.configure(cell: cell, for:indexPath.row)
        
        return cell
    }
    
    
    func openGoogleMap(lat:String,lng: String) {
        let latDouble = Double(lat)
        let longDouble = Double(lng)
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app
            
            if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(url, options: [:])
            }}
        else {
            //Open in browser
            if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(urlDestination)
            }
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
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func getMyAppointmentsSuccess() {
        indicator.stopAnimating()
        
        tableView.reloadData()
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
        
    }
    
}
