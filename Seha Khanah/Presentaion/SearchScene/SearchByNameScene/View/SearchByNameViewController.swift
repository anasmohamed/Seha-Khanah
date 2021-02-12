//
//  SearchByNameViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/21/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import MOLH
class SearchByNameViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,SearchViewProtocol,UISearchBarDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var searchByNameResultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    var searchedResultsPresenter : SearchPresenter!
    var areaId :String?
    var sepcialtyId:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchedResultsPresenter = SearchPresenter(view: self)
        searchBar.delegate = self
        searchByNameResultsTableView.delegate = self
        searchByNameResultsTableView.dataSource = self
        setupTableView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
       // view.addGestureRecognizer(tap)
        setupTableView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDoneButtonOnKeyboard()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let areaId = areaId,let sepcialtyId = sepcialtyId  else {
            return
        }
        searchedResultsPresenter.searchBy(areaId: areaId, specialtyId:sepcialtyId)
    }
    func setupTableView() {
        searchByNameResultsTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number ofr rows\(searchedResultsPresenter.searchResultCount())")
        return searchedResultsPresenter.searchResultCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetailsViewController(index :indexPath.row)
        
    }
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done".localized, style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        searchBar.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
        searchBar.resignFirstResponder()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
        cell.bookBtnActionBlock = {
            self.navigateToDetailsViewController(index :indexPath.row)
        }
        searchedResultsPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    func navigateToDetailsViewController(index :Int)  {
        let storyboard = UIStoryboard.init(name: "DoctorDetails", bundle: nil)
        
        let showDoctorDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        showDoctorDetailsViewController.doctorId = self.searchedResultsPresenter.getDoctorId(index: index)
        self.navigationController!.pushViewController(showDoctorDetailsViewController, animated: true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedResultsPresenter.searchBy(name: searchText)
        searchByNameResultsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchedResultsPresenter.searchBy(name: searchBar.text ?? "")
        
    }
    func showNoDataFoundImage() {
        searchByNameResultsTableView.isHidden = true
        noDataFoundStackView.isHidden = false
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func searchResults() {
        indicator.stopAnimating()
        searchByNameResultsTableView.reloadData()
        searchByNameResultsTableView.isHidden = false
        noDataFoundStackView.isHidden = true
    }
    
    func showError(error: String) {
        indicator.stopAnimating()
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
}
