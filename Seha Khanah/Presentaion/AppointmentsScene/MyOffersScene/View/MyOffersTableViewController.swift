//
//  MyOffersTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class MyOffersTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UserOffersReservationsProtocol{
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter : UserOffersReservationsPresenter!
    var isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = UserOffersReservationsPresenter(view:self)
        isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedin")
        if isUserLoggedIn {
            presenter.getMyOffers()
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
        return presenter.getMyOffersCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentsTableViewCell", for: indexPath) as! MyAppointmentsTableViewCell
        cell.actionBlock = {
            print(indexPath.row)
            //               self.presenter.cancelBooking(id: cell.bookingId!)
        }
        cell.mapStackViewActionBlock = {
            //               self.openGoogleMap(lat: cell.lat!, lng: cell.longtiude!)
        }
        presenter.configure(cell: cell, for:indexPath.row)
        
        return cell
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getMyOffersSuccess() {
        
    }
    
    func showError(error: String) {
        
    }
    
    
}
