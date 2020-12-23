//
//  SearchViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/15/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBySpecialtyStackView: UIStackView!
    @IBOutlet weak var searchByNameStackView: UIStackView!
    @IBOutlet weak var searchForPharmaciesStackView: UIStackView!
    
    
    @IBOutlet weak var emailBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailBtn.layer.cornerRadius = emailBtn.frame.width / 2
        let searchByNameTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchByNameTab(_:)))
        let searchBySpecialtyTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchBySpecialtyTab(_:)))
        let searchForPharmaciesTab = UITapGestureRecognizer(target: self, action: #selector(self.handleSearchForPharmaciesTab(_:)))
        
        
        searchByNameStackView.addGestureRecognizer(searchByNameTab)
        searchBySpecialtyStackView.addGestureRecognizer(searchBySpecialtyTab)
        searchForPharmaciesStackView.addGestureRecognizer(searchForPharmaciesTab)
    }
    @objc func handleSearchByNameTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchByNameViewController = storyboard?.instantiateViewController(withIdentifier: "SearchByNameViewController") as! SearchByNameViewController
        
        self.navigationController!.pushViewController(searchByNameViewController, animated: true)
        
    }
    
    @objc func handleSearchBySpecialtyTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchBySpecialtyViewController = storyboard?.instantiateViewController(withIdentifier: "SearchBySpecialtyViewController") as! SearchBySpecialtyViewController
        self.navigationController!.pushViewController(searchBySpecialtyViewController, animated: true)
        
    }
    @objc func handleSearchForPharmaciesTab(_ sender: UITapGestureRecognizer? = nil) {
        
        let searchForPharmaciesViewController = storyboard?.instantiateViewController(withIdentifier: "SearchForPharmaciesViewController") as! SearchForPharmaciesViewController
        self.navigationController!.pushViewController(searchForPharmaciesViewController, animated: true)
        
    }
    
}
