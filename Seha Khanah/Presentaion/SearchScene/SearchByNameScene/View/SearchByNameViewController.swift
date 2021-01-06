//
//  SearchByNameViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,SearchViewProtocol,UISearchBarDelegate {
    func showNoDataFoundImage() {
        searchByNameResultsTableView.isHidden = true
        noDataFoundStackView.isHidden = false
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func searchResults() {
        
        searchByNameResultsTableView.reloadData()
        searchByNameResultsTableView.isHidden = false
        noDataFoundStackView.isHidden = true
    }
    
    func showError(error: String) {
        
    }
    
    
    @IBOutlet weak var searchByNameResultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    var searchedResultsPresenter : SearchPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchedResultsPresenter = SearchPresenter(view: self)
        searchBar.delegate = self
        searchByNameResultsTableView.delegate = self
        searchByNameResultsTableView.dataSource = self
        setupTableView()
        
    }
    
    func setupTableView() {
        searchByNameResultsTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number ofr rows\(searchedResultsPresenter.searchResultCount())")
        return searchedResultsPresenter.searchResultCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "DoctorDetails", bundle: nil)
               
               let showDoctorDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
               showDoctorDetailsViewController.doctorId = searchedResultsPresenter.getDoctorId(index: indexPath.row)
               self.navigationController!.pushViewController(showDoctorDetailsViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
       
        searchedResultsPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedResultsPresenter.searchBy(name: searchText)
        searchByNameResultsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchedResultsPresenter.searchBy(name: searchBar.text ?? "")

    }
    
}
