//
//  OfferDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/20/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
import Auk
import Kingfisher
import MOLH

class OfferDetailsViewController: UIViewController,OfferDetailsProtocol {
    @IBOutlet weak var infoViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var ratingsCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var datesCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var doctorTitleLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var ratingsCollectionView: UICollectionView!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var discountPrecentageLbl: PaddingLabel!
    @IBOutlet weak var moreOrLessBtn: UIButton!
    
    @IBOutlet weak var leftArrowImage: UIImageView!
    @IBOutlet weak var rightArrowView: UIView!
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var leftArrowView: UIView!
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
    var id : String?
    var presenter : OfferDetailsPresenter!
    var arrayOfSavedOffersIds = [String]()
    
    @IBOutlet weak var addToFavoriteBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OfferDetailsPresenter(view: self)
        ratingsCollectionView.delegate = self
        ratingsCollectionView.dataSource = self
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        presenter.showDoctorDetails(id: id!)
        doctorImageView.layer.cornerRadius = doctorImageView.frame.width / 2
        setupCollectionView()
        self.navigationItem.title = "Details".localized
        if MOLHLanguage.currentAppleLanguage() == "ar"
        {
            leftArrowImage.image = leftArrowImage.image?.flipIfNeeded()
            rightArrowImage.image = rightArrowImage.image?.flipIfNeeded()
            
            //            goToLocationArrowImage.image = goToLocationArrowImage.image?.flipIfNeeded()
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: infoView)
        cornerRadiusAndShodow(view: datesView)
        cornerRadiusAndShodow(view: ratingView)
        cornerRadiusAndShodow(view: serivceProviderInfoView)
        rightArrowView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        leftArrowView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
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
        imageSlideShow.auk.settings.contentMode = .scaleAspectFill
        if offerDetails.imagesList.count != 0{
            for image in offerDetails.imagesList
            {
                imageSlideShow.auk.show(url: image)
                
            }
        }else{
            imageSlideShow.auk.show(url: offerDetails.photo!)
            
        }
        imageSlideShow.auk.startAutoScroll(delaySeconds: 3)
        priceLbl.attributedText = (offerDetails.price! + " IQD").strikeThrough()
        discountLbl.text = offerDetails.priceAfterDiscount
        
        rating.rating = Double(offerDetails.rating!)!
        discountPrecentageLbl.text = "Discount ".localized + offerDetails.discount! + "%"
        discountPrecentageLbl.padding(2, 2, 2, 2)
        doctorImageView.kf.setImage(with: URL(string: (offerDetails.doctor?.photo)!))
        if  MOLHLanguage.currentAppleLanguage() == "en"
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
        datesCollectionView.reloadData()
        ratingsCollectionView.reloadData()
        if presenter.getDates().count == 0
        {
            datesCollectionViewHeightConstraint.constant = 120
        }
        if presenter.getRatings().count == 0
        {
            ratingsCollectionViewHeightConstraint.constant = 120
        }
    }
    
    @IBAction func addToFavoriteBtnDidTapped(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        arrayOfSavedOffersIds = defaults.stringArray(forKey: "arrayOfSavedOffersIds") ?? [String]()
        
        if (arrayOfSavedOffersIds.contains(id!)){
            arrayOfSavedOffersIds = arrayOfSavedOffersIds.filter(){$0 != id}
            UserDefaults.standard.set(arrayOfSavedOffersIds, forKey: "arrayOfSavedOffersIds")
            addToFavoriteBtn.setImage(UIImage(named: "hart_border"), for: .normal)
            
        }else{
            arrayOfSavedOffersIds.append(id!)
            UserDefaults.standard.set(arrayOfSavedOffersIds, forKey: "arrayOfSavedOffersIds")
            addToFavoriteBtn.setImage(UIImage(named: "heart_solid"), for: .normal)
            
        }
    }
    func cornerRadiusAndShodow(view:UIView)  {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        //        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        //        view.layer.shouldRasterize = false
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
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
