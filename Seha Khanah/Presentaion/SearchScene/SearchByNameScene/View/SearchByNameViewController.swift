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
        searchByNameResultsTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedResultsPresenter.searchResultCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
       
        searchedResultsPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedResultsPresenter.searchBy(name: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchedResultsPresenter.searchBy(name: searchBar.text ?? "")

    }
}
