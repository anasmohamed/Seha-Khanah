//
//  LabDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import AACarousel
import Cosmos
import Auk
class LabDetailsViewController: UIViewController, LabDetailsProtocol {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var ratingCollectionView: UICollectionView!
    @IBOutlet weak var labImages: UIScrollView!
    
    @IBOutlet weak var datesView: UIView!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var labAdderss: UILabel!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    
    var labDetailsPresenter : LabDetailsPresenter!
    var titleArray = [String]()
    let locale = NSLocale.current.languageCode

    @IBOutlet weak var contentView: UIView!
    var labId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labDetailsPresenter = LabDetailsPresenter(view: self)
        labDetailsPresenter.showLabDetails(id: labId!)
        cornerRadiusAndShodow(view: datesView)
        cornerRadiusAndShodow(view: ratingView)

        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        
        ratingCollectionView.delegate = self
        ratingCollectionView.dataSource = self
        setupCollectionView()
    }
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.shadowPath = UIBezierPath(rect: datesView.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 10
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func showLabDetails(labDetails:LabDetails) {
        labImages.auk.settings.contentMode = .scaleAspectFill
        for image in labDetails.labPhotos
        {
            labImages.auk.show(url: image)
            
        }
        labImages.auk.startAutoScroll(delaySeconds: 3)
        if locale == "en"{
            labName.text = labDetails.labNameEn
            labAdderss.text = labDetails.addressEn
        }else{
            labName.text = labDetails.labNameAr
            labAdderss.text = labDetails.addressAr
        }
        rating.rating = Double(labDetails.rating!)!
        
        datesCollectionView.reloadData()
        ratingCollectionView.reloadData()
    }
    
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    
    
}
