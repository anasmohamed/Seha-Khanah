//
//  SearchByNameViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,SearchViewProtocol,UISearchBarDelegate {
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func searchResults() {
        
    }
    
    func showError(error: String) {
        
    }
    
    
    
    @IBOutlet weak var searchByNameResultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var searchedResultsPresenter : SearchPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchedResultsPresenter = SearchPresenter(view: self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
       
        searchedResultsPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchedResultsPresenter.searchBy(name: searchText)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchedResultsPresenter.searchBy(name: searchBar.text ?? "")

    }
}
