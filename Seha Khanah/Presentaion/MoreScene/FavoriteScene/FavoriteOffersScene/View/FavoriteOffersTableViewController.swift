//
//  FavoriteOffersTableViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/18/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class FavoriteOffersTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,FavoriteOffesProtocol{
    
    
    
    @IBOutlet weak var noFavortieOffersStackView: UIStackView!
    @IBOutlet weak var favortieOffersTableView: UITableView!
    
    var favoriteOffersPresenter: FavoriteOffersPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteOffersPresenter = FavoriteOffersPresenter(view: self)
        favortieOffersTableView.delegate = self
        favortieOffersTableView.dataSource = self
        setupTableView()
        let savedDoctorsIdsArray = UserDefaults.standard.stringArray(forKey: "arrayOfSavedIds") ?? [String]()
        for doctorId in savedDoctorsIdsArray{
            favoriteOffersPresenter.showDoctorBy(id: doctorId,count: savedDoctorsIdsArray.count)
        }
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteOffersPresenter.returnDoctorCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
        favoriteOffersPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func setupTableView() {
        favortieOffersTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "DoctorDetails", bundle: nil)
        
        let showDoctorDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        
        self.navigationController!.pushViewController(showDoctorDetailsViewController, animated: true)
    }
    
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getFavoriteOffersSuccess() {
        noFavortieOffersStackView.isHidden = true
        
        favortieOffersTableView.reloadData()
    }
    
    func showError(error: String) {
        noFavortieOffersStackView.isHidden = false
        
    }
    
    func showNoDataFoundImage() {
        noFavortieOffersStackView.isHidden = false
    }
    
    
}
