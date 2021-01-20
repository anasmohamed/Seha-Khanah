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
    @IBOutlet weak var infoViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var doctorTitleLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var ratingsCollectionView: UICollectionView!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var moreOrLessBtn: UIButton!
    @IBOutlet weak var discountPrecentageLbl: UILabel!
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
    var presenter : OfferDetailsPresenter!
    var locale = NSLocale.current.languageCode
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OfferDetailsPresenter(view: self)
        ratingsCollectionView.delegate = self
        ratingsCollectionView.dataSource = self
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: infoView)
        cornerRadiusAndShodow(view: datesView)
        cornerRadiusAndShodow(view: ratingView)
        cornerRadiusAndShodow(view: serivceProviderInfoView)
    }
    
    @IBAction func moreOrLessBtnDidTapped(_ sender: Any) {
        if moreOrLessBtn.titleLabel!.text == "more" || moreOrLessBtn.titleLabel!.text == "المزيد"{
            infoLbl.numberOfLines = 0
            infoLbl.sizeToFit()
            infoViewHeightConstraint.constant = infoLbl.bounds.height + 80
            moreOrLessBtn.setTitle("less".localized, for: .normal)
            cornerRadiusAndShodow(view: infoView)
            
        }else{
            infoLbl.numberOfLines = 1
            infoLbl.sizeToFit()
            infoViewHeightConstraint.constant = 120
            cornerRadiusAndShodow(view: infoView)
            moreOrLessBtn.setTitle("more".localized, for: .normal)
            
        }
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func showOfferDetails(offerDetails: OfferDetails) {
        priceLbl.text = offerDetails.price
        discountLbl.text = offerDetails.priceAfterDiscount
        rating.rating = Double(offerDetails.rating!)!
        discountPrecentageLbl.text = "Discount ".localized + offerDetails.discount! + "%"
        
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
    
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 5
    }
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    
    func showDoctorDates() {
        
    }
    
}
