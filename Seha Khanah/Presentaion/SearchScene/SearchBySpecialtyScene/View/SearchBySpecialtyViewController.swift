//
//  SearchBySpecialtyViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchBySpecialtyViewController: UIViewController ,SearchViewProtocol,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBySpecialtyBar: UISearchBar!
    @IBOutlet weak var searchBySpecialtyResultTableView: UITableView!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    
    var searchBySpecialtyPresenter: SearchBySpecialtyPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBySpecialtyBar.delegate = self
        searchBySpecialtyResultTableView.delegate = self
        searchBySpecialtyResultTableView.dataSource = self
        searchBySpecialtyPresenter = SearchBySpecialtyPresenter(view: self)
        //        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Specialty".localized
        searchBySpecialtyPresenter.getAllspecialty()
    }
    
    //    func setupTableView() {
    //         searchBySpecialtyResultTableView.register(UINib(nibName: "SearchBySpcialtyTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchBySpcialtyTableViewCell")
    //
    //     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBySpecialtyPresenter.searchResultCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard.init(name: "DoctorDetails", bundle: nil)
//
//        let showDoctorDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
//        showDoctorDetailsViewController.doctorId = searchedResultsPresenter.getDoctorId(index: indexPath.row)
//        self.navigationController!.pushViewController(showDoctorDetailsViewController, animated: true)
        
        let storyboard = UIStoryboard.init(name: "Search", bundle: nil)

        let searchByRegionViewController = storyboard.instantiateViewController(withIdentifier: "SearchByPharmacyRegionViewController") as! SearchByPharmacyRegionViewController
               searchByRegionViewController.searchForDoctor = true
        searchByRegionViewController.sepcialtyId = searchBySpecialtyPresenter.getSpecialtyId(index: indexPath.row)
               self.navigationController!.pushViewController(searchByRegionViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBySpcialtyTableViewCell", for: indexPath) as! SearchBySpcialtyTableViewCell
        searchBySpecialtyPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBySpecialtyPresenter.searchBy(specialty: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBySpecialtyPresenter.searchBy(specialty: searchBar.text ?? "")
        
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func searchResults() {
        searchBySpecialtyResultTableView.reloadData()
    }
    
    func showError(error: String) {
        
        
    }
    
    func showNoDataFoundImage() {
        searchBySpecialtyResultTableView.reloadData()
        
        noDataFoundStackView.isHidden = false
    }
}
