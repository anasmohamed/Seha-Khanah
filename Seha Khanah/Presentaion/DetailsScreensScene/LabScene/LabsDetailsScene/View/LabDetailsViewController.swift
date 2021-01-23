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
    var latitude :String?
    var longitude :String?
    @IBOutlet weak var goToLocationView: UIView!
    @IBOutlet weak var contentView: UIView!
    var labId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        labDetailsPresenter = LabDetailsPresenter(view: self)
        labDetailsPresenter.showLabDetails(id: labId!)
        
        
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: datesView)
        cornerRadiusAndShodow(view: ratingView)
        cornerRadiusAndShodow(view: goToLocationView)
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
        for image in labDetails.labPhotos
        {
            labImages.auk.show(url: image)
            
        }
        labImages.auk.startAutoScroll(delaySeconds: 3)
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
    }
    
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    
    
}
