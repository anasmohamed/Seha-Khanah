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
         let showAllPharmaciesTab = UITapGestureRecognizer(target: self, action: #selector(self.handleShowAllLabsTab(_:)))
        
        searchByLabNameStackView.addGestureRecognizer(searchByLabNameTab)
        searchByRegionStackView.addGestureRecognizer(searchByRegionTab)
        showAllStackView.addGestureRecognizer(showAllPharmaciesTab)

    }
    
    
    
    
    
    @objc func handleSearchByLabNameTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByLabNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByLabNameViewController") as! SearchByLabNameViewController
        
        self.navigationController!.pushViewController(searchByLabNameViewController, animated: true)
        
    }
    
    @objc func handleSearchByRegionTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByRegionViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByPharmacyRegionViewController") as! SearchByPharmacyRegionViewController
        searchByRegionViewController.searchForLab = true
        self.navigationController!.pushViewController(searchByRegionViewController, animated: true)
        
    }
    
    @objc func handleShowAllLabsTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let showAllLabsViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByLabNameViewController") as! SearchByLabNameViewController
        showAllLabsViewController.showAllLabs = true
        self.navigationController!.pushViewController(showAllLabsViewController, animated: true)
        
    }
    
    
  

}
