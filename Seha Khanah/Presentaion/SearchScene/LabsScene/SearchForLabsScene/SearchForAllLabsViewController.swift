//
//  SearchForAllLabsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchForAllLabsViewController: UIViewController {

   @IBOutlet weak var searchByLabNameStackView: UIStackView!
    @IBOutlet weak var showAllStackView: UIStackView!
    @IBOutlet weak var searchByRegionStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let searchByLabNameTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchByLabNameTab(_:)))
        let searchByRegionTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchByRegionTab(_:)))
         let showAllPharmaciesTab = UITapGestureRecognizer(target: self, action: #selector(self.handleShowAllPharmaciesTab(_:)))
        
        searchByLabNameStackView.addGestureRecognizer(searchByLabNameTab)
        searchByRegionStackView.addGestureRecognizer(searchByRegionTab)
        showAllStackView.addGestureRecognizer(showAllPharmaciesTab)

    }
    
    
    
    
    
    @objc func handleSearchByLabNameTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByPharmacyNameViewController") as! SearchByPharmacyNameViewController
        
        self.navigationController!.pushViewController(searchByNameViewController, animated: true)
        
    }
    
    @objc func handleSearchByRegionTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByRegionViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByPharmacyRegionViewController") as! SearchByPharmacyRegionViewController
        searchByRegionViewController.searchForLab = true
        self.navigationController!.pushViewController(searchByRegionViewController, animated: true)
        
    }
    
    @objc func handleShowAllPharmaciesTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchBySpecialtyViewController = storyboard?.instantiateViewController(withIdentifier: "ShowAllPharmaciesViewController") as! ShowAllPharmaciesViewController
        self.navigationController!.pushViewController(searchBySpecialtyViewController, animated: true)
        
    }
    
    
  

}
