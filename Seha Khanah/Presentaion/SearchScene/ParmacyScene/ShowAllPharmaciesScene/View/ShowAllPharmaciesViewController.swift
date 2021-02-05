//
//  ShowAllPharmaciesViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import MOLH
class ShowAllPharmaciesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PharmacyOffersViewProtocol {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var pharmacyOffersPresenter: PharmacyOffersPresenter!
    @IBOutlet weak var noDataFoundStackView: UIStackView!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
          super.viewDidLoad()
         
          pharmacyOffersPresenter = PharmacyOffersPresenter(view: self)
          setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "Pharmacy".localized
        
      }
      
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        pharmacyOffersPresenter.getPharmacyOffers()

    }
      func setupTableView() {
          tableView.register(UINib(nibName: "SearchByPharmacyNameTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchByPharmacyNameTableViewCell")
          
      }
      
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return pharmacyOffersPresenter.pharmacyOffersCount()
      }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 280
      }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "PharmacyDetails", bundle: nil)
        
        let showPharmacyDetailsViewController = storyboard.instantiateViewController(withIdentifier: "PharamcyDetailsViewController") as! PharamcyDetailsViewController
        showPharmacyDetailsViewController.pharmacyId = pharmacyOffersPresenter.getPharmacyId(index: indexPath.row)
        self.navigationController!.pushViewController(showPharmacyDetailsViewController, animated: true)
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "SearchByPharmacyNameTableViewCell", for: indexPath) as! SearchByPharmacyNameTableViewCell
        
          pharmacyOffersPresenter.configure(cell: cell, for: indexPath.row)
        
          return cell
      }
      
   
      
      func showIndicator() {
          
      }
      
      func hideIndicator() {
          
      }
      func pharamcyOffersResults() {
          tableView.reloadData()
      }
      
      func showError(error: String) {
          
          
      }
      
      func showNoDataFoundImage() {
          tableView.reloadData()
          
          noDataFoundStackView.isHidden = false
      }
      
    

}
