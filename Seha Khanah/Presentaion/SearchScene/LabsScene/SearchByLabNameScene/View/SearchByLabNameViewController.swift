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
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
//        view.addGestureRecognizer(tap)
        setupTableView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        navigationToDetailsViewController(index: indexPath.row)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchByLabNameTableViewCell", for: indexPath) as! SearchByLabNameTableViewCell
        cell.bookBtnActionBlock = {
            self.navigationToDetailsViewController(index: indexPath.row)
        }
        labPresenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func navigationToDetailsViewController(index:Int)  {
           let storyboard = UIStoryboard.init(name: "LabDetails", bundle: nil)
                 
                 let showLabsDetailsViewController = storyboard.instantiateViewController(withIdentifier: "LabDetailsViewController") as! LabDetailsViewController
                 showLabsDetailsViewController.labId = self.labPresenter.getLabId(index: index)
                 self.navigationController!.pushViewController(showLabsDetailsViewController, animated: true)
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
        searchByLabNameTableView.isHidden = true
        noDataFoundStackView.isHidden = false
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func labsResults() {
        indicator.stopAnimating()
        searchByLabNameTableView.isHidden = false
        searchByLabNameTableView.reloadData()
        noDataFoundStackView.isHidden = true

    }
    
    
    
    
    
    
}
