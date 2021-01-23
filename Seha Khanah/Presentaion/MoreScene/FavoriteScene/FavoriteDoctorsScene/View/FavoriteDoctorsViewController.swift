//
//  FavoriteDoctorsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/15/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class FavoriteDoctorsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,FavoriteDoctorProtocol{
    
    
    @IBOutlet weak var noFavortieDoctorsStackView: UIStackView!
    @IBOutlet weak var favortieDoctorsTableView: UITableView!
    
    var favoriteDoctorPresenter: FavoriteDoctosPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteDoctorPresenter = FavoriteDoctosPresenter(view: self)
        favortieDoctorsTableView.delegate = self
        favortieDoctorsTableView.dataSource = self
        setupTableView()
        let savedDoctorsIdsArray = UserDefaults.standard.stringArray(forKey: "arrayOfSavedIds") ?? [String]()
        for doctorId in savedDoctorsIdsArray{
            favoriteDoctorPresenter.showDoctorBy(id: doctorId,count: savedDoctorsIdsArray.count)
        }
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteDoctorPresenter.returnDoctorCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as! SearchResultTableViewCell
        favoriteDoctorPresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func setupTableView() {
        favortieDoctorsTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "DoctorDetails", bundle: nil)
        
        let showDoctorDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        showDoctorDetailsViewController.doctorId = favoriteDoctorPresenter.getDoctorId(index: indexPath.row)
        self.navigationController!.pushViewController(showDoctorDetailsViewController, animated: true)
    }
    
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getFavoriteDoctorsSuccess() {
        noFavortieDoctorsStackView.isHidden = true

        favortieDoctorsTableView.reloadData()
    }
    
    func showError(error: String) {
        noFavortieDoctorsStackView.isHidden = false

    }
    
    func showNoDataFoundImage() {
        noFavortieDoctorsStackView.isHidden = false
    }
    
    
}
