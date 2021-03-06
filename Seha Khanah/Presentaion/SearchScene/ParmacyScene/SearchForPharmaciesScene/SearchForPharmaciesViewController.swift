//
//  SearchForPharmaciesViewControllViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/23/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchForPharmaciesViewController: UIViewController {
    @IBOutlet weak var searchByPharmacyNameStackView: UIStackView!
    @IBOutlet weak var showAllStackView: UIStackView!
    @IBOutlet weak var searchByRegionStackView: UIStackView!
    
    @IBOutlet weak var arrowImageOne: UIImageView!
    @IBOutlet weak var arrowImageTwo: UIImageView!
    @IBOutlet weak var arrowImageThree: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrowImageOne.image = arrowImageOne.image?.flipIfNeeded()
        arrowImageTwo.image = arrowImageTwo.image?.flipIfNeeded()
        arrowImageThree.image = arrowImageThree.image?.flipIfNeeded()
        let searchByPharmacyNameTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchByPharmacyNameTab(_:)))
        let searchByRegionTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchByRegionTab(_:)))
        let showAllPharmaciesTab = UITapGestureRecognizer(target: self, action: #selector(self.handleShowAllPharmaciesTab(_:)))
        
        searchByPharmacyNameStackView.addGestureRecognizer(searchByPharmacyNameTab)
        searchByRegionStackView.addGestureRecognizer(searchByRegionTab)
        showAllStackView.addGestureRecognizer(showAllPharmaciesTab)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    @objc func handleSearchByPharmacyNameTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByPharmacyNameViewController") as! SearchByPharmacyNameViewController
        
        self.navigationController!.pushViewController(searchByNameViewController, animated: true)
        
    }
    
    @objc func handleSearchByRegionTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByRegionViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByPharmacyRegionViewController") as! SearchByPharmacyRegionViewController
        searchByRegionViewController.searchForLab = false
        self.navigationController!.pushViewController(searchByRegionViewController, animated: true)
        
    }
    
    @objc func handleShowAllPharmaciesTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchBySpecialtyViewController = storyboard?.instantiateViewController(withIdentifier: "ShowAllPharmaciesViewController") as! ShowAllPharmaciesViewController
        self.navigationController!.pushViewController(searchBySpecialtyViewController, animated: true)
        
    }
    
    
}
