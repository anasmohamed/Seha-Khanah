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
import MOLH

class LabDetailsViewController: UIViewController, LabDetailsProtocol {
    @IBOutlet weak var datesCollectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var goToLocationArrowImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var ratingsCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftArrowImage: UIImageView!
    @IBOutlet weak var rightArrowView: UIView!
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var leftArrowView: UIView!
    @IBOutlet weak var ratingCollectionView: UICollectionView!
    @IBOutlet weak var labImages: UIScrollView!
    
    @IBOutlet weak var datesView: UIView!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var labAdderss: UILabel!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    
    var labDetailsPresenter : LabDetailsPresenter!
    var titleArray = [String]()
    var latitude :String?
    var longitude :String?
    @IBOutlet weak var goToLocationView: UIView!
    @IBOutlet weak var contentView: UIView!
    var labId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labDetailsPresenter = LabDetailsPresenter(view: self)
        labDetailsPresenter.showLabDetails(id: labId!)
        if MOLHLanguage.currentAppleLanguage() == "ar"
        {
            leftArrowImage.image = leftArrowImage.image?.flipIfNeeded()
            rightArrowImage.image = rightArrowImage.image?.flipIfNeeded()
            
            goToLocationArrowImage.image = goToLocationArrowImage.image?.flipIfNeeded()
            
        }
        
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        
        ratingCollectionView.delegate = self
        ratingCollectionView.dataSource = self
        setupCollectionView()
        let goToLocationTap = UITapGestureRecognizer(target: self, action: #selector(self.handleGoToLocationTab(_:)))
        
        goToLocationView.addGestureRecognizer(goToLocationTap)
        
    }
    
    @objc func handleGoToLocationTab(_ sender: UITapGestureRecognizer? = nil) {
        
        openGoogleMap(lat: latitude ?? "", lng: longitude ?? "")
    }
    func openGoogleMap(lat:String,lng: String) {
        let latDouble = Double(lat)
        let longDouble = Double(lng)
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app
            
            if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(url, options: [:])
            }}
        else {
            //Open in browser
            if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(urlDestination)
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Details".localized
        datesView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0.1, height: 0.1), radius: 3, scale: true)
        ratingView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        goToLocationView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
      
        leftArrowView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        rightArrowView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
    }
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 7
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 6
    }
    
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func showLabDetails(labDetails:LabDetails) {
        labImages.auk.settings.contentMode = .scaleAspectFill
        if labDetails.labPhotos.count != 0 {
        for image in labDetails.labPhotos
        {
            labImages.auk.show(url: image)
            
        }
        labImages.auk.startAutoScroll(delaySeconds: 3)
        }else{
            labImages.auk.show(url: labDetails.photo!)
        }
        if  MOLHLanguage.currentAppleLanguage() == "en"{
            labName.text = labDetails.labNameEn
            labAdderss.text = labDetails.addressEn
        }else{
            labName.text = labDetails.labNameAr
            labAdderss.text = labDetails.addressAr
        }
        rating.rating = Double(labDetails.rating!)!
        latitude = labDetails.latitude
        longitude = labDetails.logitude
        datesCollectionView.reloadData()
        ratingCollectionView.reloadData()
        if labDetailsPresenter.getDatesCount() == 0
        {
            datesCollectionViewHeightConstraint.constant = 120
        }
        if labDetailsPresenter.getRatingsCount() == 0
        {
            ratingsCollectionViewHeightConstraint.constant = 120
        }
    }
    
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    
    
}
