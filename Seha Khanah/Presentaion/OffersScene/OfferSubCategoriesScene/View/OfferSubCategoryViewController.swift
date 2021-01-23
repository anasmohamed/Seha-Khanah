//
//  OfferSubCategoryViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/23/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class OfferSubCategoryViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,OfferSubCategoryProtocol{
 
    
    
    var presenter : OfferSubCategoryPresenter!
    @IBOutlet weak var tableView: UITableView!
    var id: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter = OfferSubCategoryPresenter(view:self)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getOffersCategories(id: id!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getOffersSubCategoryCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        cell.textLabel?.text = presenter.getOffersSubCategoryName(index: indexPath.row)
        return cell
    }
    func showIndicator() {
         
     }
     
     func hideIndicator() {
         
     }
     
     func getOffersSubCategorySuccess() {
        tableView.reloadData()
     }
     
     func showError(error: String) {
         
     }
     

}
