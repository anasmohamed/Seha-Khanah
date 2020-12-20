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
    
    
    @IBOutlet weak var tableView: UITableView!
    

    
    @IBOutlet weak var imageSlider: AACarousel!
    @IBOutlet weak var offersCategoriesCollectionView: UICollectionView!
    var presenter: OffersCategoriesPresenter!
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offersCategoriesCollectionView.delegate = self
        offersCategoriesCollectionView.dataSource = self
        presenter = OffersCategoriesPresenter(view : self)
        setupCollectionView()
        
        let pathArray = ["http://www.gettyimages.ca/gi-resources/images/Embed/new/embed2.jpg",
                         "https://ak.picdn.net/assets/cms/97e1dd3f8a3ecb81356fe754a1a113f31b6dbfd4-stock-photo-photo-of-a-common-kingfisher-alcedo-atthis-adult-male-perched-on-a-lichen-covered-branch-107647640.jpg",
                         "https://imgct2.aeplcdn.com/img/800x600/car-data/big/honda-amaze-image-12749.png",
                         "http://www.conversion-uplift.co.uk/wp-content/uploads/2016/09/Lamborghini-Huracan-Image-672x372.jpg",
                         "very-large-flamingo"]
        titleArray = ["picture 1","picture 2","picture 3","picture 4","picture 5"]
        imageSlider.delegate = self
        imageSlider.setCarouselData(paths: pathArray,  describedTitle: titleArray, isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        //optional methods
        imageSlider.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        imageSlider.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 5, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: nil)
        presenter.getOffersCategories()
        collectionViewLayoutInsets()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
