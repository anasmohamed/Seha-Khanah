//
//  MyLabsAppointmentsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 3/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import UIKit
class MyLabsAppintmentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MyLabsAppointmentsProtocol {
    
    
    
    
    
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var myLabsAppointmentsPresenter : MyLabsAppointmentsPresenter!
    var isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Appointments".localized
        myLabsAppointmentsPresenter = MyLabsAppointmentsPresenter(view: self)
        isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isUserLoggedIn {
            myLabsAppointmentsPresenter.getMyAppintments()
            
        }
    }
    
    // MARK: - Table view data source
    func setupTableView() {
        tableView.register(UINib(nibName: "MyAppointmentsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAppointmentsTableViewCell")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myLabsAppointmentsPresenter.getMyAppointmentsCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentsTableViewCell", for: indexPath) as! MyAppointmentsTableViewCell
        if self.myLabsAppointmentsPresenter.getAppointmentStatus(index: indexPath.row) == "1"{
            cell.cancelView.isHidden = false
            cell.cancelLbl.isHidden = false
            
            cell.cancelLbl.text = "Cancel".localized
            cell.cancelImageView.image = UIImage(named: "cancel")
        }else if self.myLabsAppointmentsPresenter.getAppointmentStatus(index: indexPath.row) == "3"{
            cell.cancelView.isHidden = false
            cell.cancelLbl.isHidden = false
            
            cell.cancelLbl.text = "Add Review".localized
            cell.cancelImageView.image = UIImage(named: "add-comment-button")
        }else if self.myLabsAppointmentsPresenter.getAppointmentStatus(index: indexPath.row) == "2"{
            cell.cancelView.isHidden = true
            cell.cancelLbl.isHidden = true
        }
        cell.actionBlock = {
            print(indexPath.row)
            if self.myLabsAppointmentsPresenter.getAppointmentStatus(index: indexPath.row) == "1"
            {
                self.showAlert(bookingId : cell.bookingId!)
            }else if self.myLabsAppointmentsPresenter.getAppointmentStatus(index: indexPath.row) == "3"{
                let addReviewStoryboard = UIStoryboard.init(name: "AddReview", bundle: nil)
                let addReviewViewController = addReviewStoryboard.instantiateViewController(withIdentifier:"AddReviewViewController") as! AddReviewViewController
                addReviewViewController.bookId = Int(cell.bookingId!)!
                addReviewViewController.onDoneBlock = {(message) in
                    self.view.makeToast(message.localized, duration: 3.0, position: .bottom)
                    
                }
                self.present(addReviewViewController,animated: true)
                
            }
        }
        cell.mapStackViewActionBlock = {
            self.openGoogleMap(lat: cell.lat!, lng: cell.longtiude!)
        }
        cell.helpRequestActionBlock = {
            let storyboard = UIStoryboard.init(name: "CallUs", bundle:nil )
            let callUsViewController = storyboard.instantiateViewController(withIdentifier: "CallUsViewController") as! CallUsViewController
            self.navigationController!.pushViewController(callUsViewController, animated: true)
        }
        myLabsAppointmentsPresenter.configure(cell: cell, for:indexPath.row)
        
        return cell
    }
    
    
    func showAlert(bookingId : String)  {
        let alert = UIAlertController(title: "Booking Cancel".localized, message: "Are you sure to cancel the reservation?".localized, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes".localized, style: .default,handler: { action in
            
            self.myLabsAppointmentsPresenter.cancelBooking(id: bookingId)
            
            
        }))
        alert.addAction(UIAlertAction(title: "No".localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true,completion: nil)
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
    func showNoDataFoundStackView() {
        noDataFoundStackView.isHidden = false
        tableView.isHidden = true
        indicator.stopAnimating()
    }
    
    func getMyLabsAppointmentsSuccess() {
        indicator.stopAnimating()
        tableView.isHidden = false
        noDataFoundStackView.isHidden = true
        tableView.reloadData()
    }
    func showError(error: String) {
        indicator.stopAnimating()
        
    }
    func cancelReservationSuccess() {
        self.view.makeToast("Reservation Cancelled Successfully".localized, duration: 3.0, position: .bottom)
        if isUserLoggedIn {
            myLabsAppointmentsPresenter.getMyAppintments()
            
        }
    }
}
