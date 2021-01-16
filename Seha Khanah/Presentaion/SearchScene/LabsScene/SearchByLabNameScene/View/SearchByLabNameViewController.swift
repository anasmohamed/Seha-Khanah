//
//  SearchByLabNameViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByLabNameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate,SearchByLabNameProtocol {
    
    @IBOutlet weak var searchByLabNameBar: UISearchBar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchByLabNameTableView: UITableView!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    var areaId: String?
    var showAllLabs = false
    var labPresenter: SearchByLabNamePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchByLabNameBar.delegate = self
        searchByLabNameTableView.delegate = self
        searchByLabNameTableView.dataSource = self
        labPresenter = SearchByLabNamePresenter(view: self)
        
        setupTableView()
        
        if areaId != nil{
            labPresenter.searchForLabBy(araeId: areaId!)
        }
        
        if showAllLabs{
            labPresenter.getAllLabs()
        }
    }
    
    
    
    func setupTableView() {
        searchByLabNameTableView.register(UINib(nibName: "SearchByLabNameTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchByLabNameTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labPresenter.labsCount()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "LabDetails", bundle: nil)
        
        let showLabsDetailsViewController = storyboard.instantiateViewController(withIdentifier: "LabDetailsViewController") as! LabDetailsViewController
        showLabsDetailsViewController.labId = labPresenter.getLabId(index: indexPath.row)
        self.navigationController!.pushViewController(showLabsDetailsViewController, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchByLabNameTableViewCell", for: indexPath) as! SearchByLabNameTableViewCell
        
        labPresenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        labPresenter.getPharmacyOffers()
        labPresenter.searchByLab(name: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //        labPresenter.getPharmacyOffers()
        labPresenter.searchByLab(name: searchBar.text ?? "")
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()

    }
    
    func showError(error: String) {
        indicator.stopAnimating()

        
    }
    
    func showNoDataFoundImage() {
        indicator.stopAnimating()

        searchByLabNameTableView.reloadData()
        
        noDataFoundStackView.isHidden = false
    }
    
    
    
    
    func labsResults() {
        indicator.stopAnimating()

        searchByLabNameTableView.reloadData()
        
    }
    
    
    
    
    
    
}
