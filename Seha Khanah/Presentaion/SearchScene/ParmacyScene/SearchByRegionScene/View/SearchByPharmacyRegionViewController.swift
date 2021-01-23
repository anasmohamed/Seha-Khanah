//
//  SearchByPharmacyRegionViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import MOLH

class SearchByPharmacyRegionViewController:UIViewController, UITableViewDataSource,UITableViewDelegate,AreasProtocol {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var regionPresenter: RegionPresenter!
    var searchForLab = false
    var searchForDoctor = false
    var sepcialtyId : String?
    let locale = NSLocale.current.languageCode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        regionPresenter = RegionPresenter(view: self)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AllRegionsCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        regionPresenter.getAreas()

    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionPresenter.areasCount()
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchForLab{
            
            
            let searchByLabNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByLabNameViewController") as! SearchByLabNameViewController
            searchByLabNameViewController.areaId = regionPresenter.getAreaIdAt(index: indexPath.row)
            self.navigationController!.pushViewController(searchByLabNameViewController, animated: true)
        }else if (searchForDoctor){
            let searchByNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByNameViewController") as! SearchByNameViewController
            searchByNameViewController.areaId = regionPresenter.getAreaIdAt(index: indexPath.row)
            searchByNameViewController.sepcialtyId = sepcialtyId
            self.navigationController!.pushViewController(searchByNameViewController, animated: true)
        }
        else {
            let searchByPharmacyNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByPharmacyNameViewController") as! SearchByPharmacyNameViewController
            searchByPharmacyNameViewController.searchByAreaId = true
            self.navigationController!.pushViewController(searchByPharmacyNameViewController, animated: true)
        }
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllRegionsCell", for: indexPath)
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            cell.textLabel?.text = regionPresenter.getAreasList()[indexPath.row].areaNameEn
            
        }else{
            cell.textLabel?.text = regionPresenter.getAreasList()[indexPath.row].areaNameAr
            
        }
        
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
