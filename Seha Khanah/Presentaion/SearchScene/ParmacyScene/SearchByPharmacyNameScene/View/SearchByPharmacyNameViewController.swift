//
//  SearchByPharmacyNameViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByPharmacyNameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate,PharmacyOffersViewProtocol{
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var searchBypharmacyNameBar: UISearchBar!
    @IBOutlet weak var searchByPharmacyNameTableView: UITableView!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    var searchByAreaId = false
    
    var pharmacyOffersPresenter: PharmacyOffersPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBypharmacyNameBar.delegate = self
        searchByPharmacyNameTableView.delegate = self
        searchByPharmacyNameTableView.dataSource = self
        pharmacyOffersPresenter = PharmacyOffersPresenter(view: self)
        setupTableView()
        self.navigationItem.title  = "Search".localized
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if searchByAreaId
        {
            pharmacyOffersPresenter.getPharmacyOffers()
        }
    }
    func setupTableView() {
        searchByPharmacyNameTableView.register(UINib(nibName: "SearchByPharmacyNameTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchByPharmacyNameTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyOffersPresenter.pharmacyOffersCount()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pharmacyOffersPresenter.getPharmacyOffers()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pharmacyOffersPresenter.getPharmacyOffers()
        
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    func pharamcyOffersResults() {
        searchByPharmacyNameTableView.isHidden = false
        searchByPharmacyNameTableView.reloadData()
        noDataFoundStackView.isHidden = true
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
    }
    
    func showNoDataFoundImage() {
        indicator.stopAnimating()
        searchByPharmacyNameTableView.isHidden = true
        noDataFoundStackView.isHidden = false
    }
    
    
    
}
