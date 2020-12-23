//
//  SearchBySpecialtyViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchBySpecialtyViewController: UIViewController ,SearchViewProtocol,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate{
    
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
        searchBySpecialtyPresenter.getAllspecialty()
    }
    
//    func setupTableView() {
//         searchBySpecialtyResultTableView.register(UINib(nibName: "SearchBySpcialtyTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchBySpcialtyTableViewCell")
//
//     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBySpecialtyPresenter.searchResultCount()
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
