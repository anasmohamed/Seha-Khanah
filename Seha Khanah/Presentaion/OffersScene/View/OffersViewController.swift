//
//  OffersViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/18/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import AACarousel
import Kingfisher
class OffersViewController: UIViewController,OffersCategorisViewProtocol,UICollectionViewDelegate,UICollectionViewDataSource ,AACarouselDelegate,UICollectionViewDelegateFlowLayout {
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
    }
    
    func didSelectCarouselView(_ view: AACarousel, _ index: Int) {
    
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //require method
    func downloadImages(_ url: String, _ index: Int) {
        
        //here is download images area
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(0))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            print(error)
            self.imageSlider.images[index] = downloadImage!
               })
        
    }
    func getOffersCategorisSuccess() {
        offersCategoriesCollectionView.reloadData()
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func startAutoScroll() {
          //optional method
          imageSlider.startScrollImageView()
           
       }
       
       func stopAutoScroll() {
           //optional method
           imageSlider.stopScrollImageView()
       }
    
    func showError(error: String) {
        print("error \(error)")
    }
    
    
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getOffersCategories()
        
    }
    
    
    func setupCollectionView() {
        offersCategoriesCollectionView.register(UINib(nibName: "OfferCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferCategoriesCollectionViewCell")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0
        {
            return 1
        }
        return presenter.getOffersCategoriesCount()
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCategoriesCollectionViewCell.identifier, for: indexPath) as! OfferCategoriesCollectionViewCell
        if indexPath.section == 0{
            presenter.configure(cell: cell, for: 0)

        }else{
            presenter.configure(cell: cell, for: indexPath.row)

        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0
        {
            return CGSize(width: 120, height: 150)
        }else
        {
            return CGSize(width: 60, height: 100)

        }
    }
    
    
}
