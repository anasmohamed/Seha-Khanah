//
//  OffersViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import AACarousel
class OffersViewController: UIViewController {
    
    
    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var mostOrderOffersTableView: UITableView!

    @IBOutlet weak var offersCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var mostOrderedOffersTableView: UITableView!
    
    
    var mostOrderedOffersPresenter : MostOrderedOffersPresenter!
    var presenter: OffersCategoriesPresenter!
    var titleArray = [String]()
    var locale = NSLocale.current.languageCode
    override func viewDidLoad() {
        super.viewDidLoad()
        offersCategoriesCollectionView.delegate = self
        offersCategoriesCollectionView.dataSource = self
        
        mostOrderOffersTableView.delegate = self
        mostOrderedOffersTableView.dataSource = self
        
        
        presenter = OffersCategoriesPresenter(view : self)
        mostOrderedOffersPresenter = MostOrderedOffersPresenter(view: self)
        setupCollectionView()
        setupMostOrderedOffersTableView()
       
        
        presenter.getOffersCategories()
        mostOrderedOffersPresenter.getMostOrderedOffers()
        mostOrderedOffersPresenter.getMostOrderedOffersImage()
        collectionViewLayoutInsets()
        offersCategoriesCollectionView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        //in cellForItemAtIndexPath
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
