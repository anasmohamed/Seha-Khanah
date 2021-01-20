//
//  OfferDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/20/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
class OfferDetailsViewController: UIViewController,OfferDetailsProtocol {
    
    @IBOutlet weak var doctorTitleLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var ratingsCollectionView: UICollectionView!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var moreOrLessBtn: UIButton!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    @IBOutlet weak var serivceProviderInfoView: UIView!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var deviceTitleLbl: UILabel!
    @IBOutlet weak var offerTitleLbl: UILabel!
    @IBOutlet weak var datesView: UIView!
    @IBOutlet weak var imageSlideShow: UIScrollView!
    @IBOutlet weak var ratingView: UIView!
    var locale = NSLocale.current.languageCode
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func moreOrLessBtnDidTapped(_ sender: Any) {
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func showOfferDetails(offerDetails: OfferDetails) {
        priceLbl.text = offerDetails.price
        discountLbl.text = offerDetails.priceAfterDiscount
        rating.rating = Double(offerDetails.rating!)!
        
        
        if locale == "en"
        {
            infoLbl.text = offerDetails.descriptionEn
            offerTitleLbl.text = offerDetails.titleNameEn
            deviceTitleLbl.text = offerDetails.deviceNameEn
            doctorNameLbl.text = (offerDetails.doctor?.doctorFirstNameEn)! + " " + (offerDetails.doctor?.doctorLastNameEn)!
            doctorTitleLbl.text = offerDetails.doctor?.prefixTitleEn
            
        }else{
            offerTitleLbl.text = offerDetails.titleNameAr
            deviceTitleLbl.text = offerDetails.deviceNameAr
            doctorNameLbl.text = (offerDetails.doctor?.doctorFirstNameAr)! + " " + (offerDetails.doctor?.doctorLastNameAr)!
            doctorTitleLbl.text = offerDetails.doctor?.prefixTitleAr
            infoLbl.text = offerDetails.descriptionAr

        }
    }
    
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    
    func showDoctorDates() {
        
    }
    
}
