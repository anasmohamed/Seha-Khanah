//
//  SearchByPharmacyNameViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByPharmacyNameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate,PharmacyOffersViewProtocol{
    
    @IBOutlet weak var searchBypharmacyNameBar: UISearchBar!
    @IBOutlet weak var searchByPharmacyNameTableView: UITableView!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    
    var pharmacyOffersPresenter: PharmacyOffersPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBypharmacyNameBar.delegate = self
        searchByPharmacyNameTableView.delegate = self
        searchByPharmacyNameTableView.dataSource = self
        pharmacyOffersPresenter = PharmacyOffersPresenter(view: self)
        setupTableView()
    }
    
    
    
    func setupTableView() {
        searchByPharmacyNameTableView.register(UINib(nibName: "SearchByPharmacyNameTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchByPharmacyNameTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyOffersPresenter.pharmacyOffersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchByPharmacyNameTableViewCell", for: indexPath) as! SearchByPharmacyNameTableViewCell
        pharmacyOffersPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pharmacyOffersPresenter.getPharmacyOffers()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pharmacyOffersPresenter.getPharmacyOffers()
        
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    func pharamcyOffersResults() {
        searchByPharmacyNameTableView.reloadData()
    }
    
    func showError(error: String) {
        
        
    }
    
    func showNoDataFoundImage() {
        searchByPharmacyNameTableView.reloadData()
        
        noDataFoundStackView.isHidden = false
    }
    
    
    
}
