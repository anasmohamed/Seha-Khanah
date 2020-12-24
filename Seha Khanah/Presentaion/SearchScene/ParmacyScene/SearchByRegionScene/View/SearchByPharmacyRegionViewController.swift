//
//  SearchByPharmacyRegionViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByPharmacyRegionViewController: UITableViewController,AreasProtocol {
    
    
    
    var regionPresenter: RegionPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regionPresenter = RegionPresenter(view: self)
        regionPresenter.getAreas()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AllRegionsCell")

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionPresenter.areasCount()
    }
  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllRegionsCell", for: indexPath)
        cell.textLabel?.text = regionPresenter.getAreasList()[indexPath.row].areaNameEn
        
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
        
    }
    
    
}
