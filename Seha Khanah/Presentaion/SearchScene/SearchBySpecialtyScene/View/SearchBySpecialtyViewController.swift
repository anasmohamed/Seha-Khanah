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
        setupToolbar()
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
    func setupToolbar(){
           //Create a toolbar
           let bar = UIToolbar()
           
           //Create a done button with an action to trigger our function to dismiss the keyboard
        let doneBtn = UIBarButtonItem(title: "Done".localized, style: .plain, target: self, action: #selector(dismissMyKeyboard))
           
           //Create a felxible space item so that we can add it around in toolbar to position our done button
           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           
           //Add the created button items in the toobar
           bar.items = [flexSpace, flexSpace, doneBtn]
           bar.sizeToFit()
           
           //Add the toolbar to our textfield
           searchBySpecialtyBar.inputAccessoryView = bar
        
       }
       
       @objc func dismissMyKeyboard(){
           view.endEditing(true)
       }
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
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func searchResults() {
        indicator.stopAnimating()

        searchBySpecialtyResultTableView.isHidden = false
        searchBySpecialtyResultTableView.reloadData()
        noDataFoundStackView.isHidden = true
        

    }
    
    func showError(error: String) {
        indicator.stopAnimating()

        
    }
    
    func showNoDataFoundImage() {
        searchBySpecialtyResultTableView.reloadData()
        searchBySpecialtyResultTableView.isHidden = true

        noDataFoundStackView.isHidden = false
    }
}
