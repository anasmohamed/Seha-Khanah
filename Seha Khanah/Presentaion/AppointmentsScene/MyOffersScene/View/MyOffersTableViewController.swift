//
//  MyOffersTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class MyOffersTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UserOffersReservationsProtocol{
    
    
    
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : UserOffersReservationsPresenter!
    var isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = UserOffersReservationsPresenter(view:self)
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
            presenter.getMyOffers()
            
        }
    }
    // MARK: - Table view data source
    func setupTableView() {
        tableView.register(UINib(nibName: "MyAppointmentsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAppointmentsTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return presenter.getMyOffersCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentsTableViewCell", for: indexPath) as! MyAppointmentsTableViewCell
        
      
        if self.presenter.getAppointmentStatus(index: indexPath.row) == "1"{
            cell.cancelView.isHidden = false
            cell.cancelLbl.isHidden = false

            cell.cancelLbl.text = "Cancel".localized
            cell.cancelImageView.image = UIImage(named: "cancel")
        }else if self.presenter.getAppointmentStatus(index: indexPath.row) == "3"{
            cell.cancelView.isHidden = false
            cell.cancelLbl.isHidden = false

            cell.cancelLbl.text = "Add Review".localized
            cell.cancelImageView.image = UIImage(named: "add-comment-button")
        }else if self.presenter.getAppointmentStatus(index: indexPath.row) == "2"{
            cell.cancelView.isHidden = true
            cell.cancelLbl.isHidden = true
        }
        cell.actionBlock = {
            print(indexPath.row)
            if self.presenter.getAppointmentStatus(index: indexPath.row) == "1"
            {
                self.showAlert(bookingId : cell.bookingId!)
                
            }else if self.presenter.getAppointmentStatus(index: indexPath.row) == "3"{
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
        presenter.configure(cell: cell, for:indexPath.row)
        
        return cell
    }
    func showAlert(bookingId : String)  {
        let alert = UIAlertController(title: "Booking Cancel".localized, message: "Are you sure to cancel the reservation?".localized, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes".localized, style: .default,handler: { action in
            
            self.presenter.cancelBooking(id: bookingId)
            
            
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
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func getMyAppointmentsSuccess() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
        
    }
    func getMyOffersSuccess() {
        indicator.stopAnimating()
        tableView.isHidden = false
        noDataFoundStackView.isHidden = true
        tableView.reloadData()
    }
    
    func showNoDataFoundStackView() {
        tableView.isHidden = true
        noDataFoundStackView.isHidden = false
        indicator.stopAnimating()
    }
    
    func cancelReservationSuccess() {
        self.view.makeToast("Reservation Cancelled Successfully".localized, duration: 3.0, position: .bottom)
        if isUserLoggedIn {
            presenter.getMyOffers()
            
        }
    }
}
