//
//  DoctorDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
import MOLH

import ReadMoreTextView
class DoctorDetailsViewController: UIViewController,DoctorDetailsProtocol {
    @IBOutlet weak var datesView: UIView!
    @IBOutlet weak var ratingsCollectionView: UICollectionView!
    
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    @IBOutlet weak var goToLocationView: UIView!
    @IBOutlet weak var aboutDoctorTextView: ReadMoreTextView!
    
    @IBOutlet weak var ratingsCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var aboutDoctorLbl: UILabel!
    @IBOutlet weak var doctorView: UIView!
    
    @IBOutlet weak var aboutDoctorView: UIView!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var numberOfRaitings: UILabel!
    
    
    @IBOutlet weak var leftArrowView: UIView!
    @IBOutlet weak var numberOfVisitorsLbl: PaddingLabel!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var moreAndLessLbl: UILabel!
    @IBOutlet weak var aboutDoctorViewHeight: NSLayoutConstraint!
    @IBOutlet weak var totalRating: CosmosView!
    @IBOutlet weak var watingTimeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var profissionalTitleLbl: UILabel!
    @IBOutlet weak var numberOfSeenLbl: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var goToLocationArrowImage: UIImageView!
    let locale = NSLocale.current.languageCode
    var isAddToFavoriteBtnTapped = false
    var arrayOfSavedIds = [String]()
    @IBOutlet weak var rightArrowView: UIView!
    @IBOutlet weak var addDoctorToFavoriteBtn: UIButton!
    @IBOutlet weak var datesCollectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var leftArrowImage: UIImageView!
    var doctorId : String?
    var lat : String?
    var lng:String?
    var presenter : DoctorDetailsPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        rightArrowView.transform =  CGAffineTransform(scaleX: 1, y: -1)
        if MOLHLanguage.currentAppleLanguage() == "ar"
        {
            leftArrowImage.image = leftArrowImage.image?.flipIfNeeded()
            rightArrowImage.image = rightArrowImage.image?.flipIfNeeded()
            
            goToLocationArrowImage.image = goToLocationArrowImage.image?.flipIfNeeded()
            
        }
        presenter = DoctorDetailsPresenter(view:self)
        presenter.showDoctorDetails(id: doctorId!)
        aboutDoctorLbl.numberOfLines = 1
        doctorImageView.layer.cornerRadius = doctorImageView.frame.width / 2
        doctorImageView.layer.borderColor = UIColor.gray.cgColor
        doctorImageView.layer.borderWidth = 1
        
        let moreOrLessTap = UITapGestureRecognizer(target: self, action:#selector(moreOrLessLblDidTapped(_:)))
        
        moreAndLessLbl.addGestureRecognizer(moreOrLessTap)
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        ratingsCollectionView.delegate = self
        ratingsCollectionView.dataSource = self
        setupCollectionView()
        arrayOfSavedIds = UserDefaults.standard.stringArray(forKey: "arrayOfSavedIds") ?? [String]()
        
        if (arrayOfSavedIds.contains(where: {$0 == doctorId})){
            addDoctorToFavoriteBtn.setImage(UIImage(named: "heart_solid"), for: .normal)
        }
        let goToLocationTap = UITapGestureRecognizer(target: self, action: #selector(self.handleGoToLocationTab(_:)))
        
        goToLocationView.addGestureRecognizer(goToLocationTap)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.showDoctorDates(id: doctorId!)
        cornerRadiusAndShodow(view: doctorView)
        cornerRadiusAndShodow(view: aboutDoctorView)
        cornerRadiusAndShodow(view: ratingView)
        cornerRadiusAndShodow(view: datesView)
        cornerRadiusAndShodow(view: goToLocationView)
        rightArrowView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        leftArrowView.dropShadow(color: .gray, opacity: 0.4, offSet: CGSize(width: 0, height: 1), radius: 3, scale: true)
        //        cornerRadiusAndShodowForArrows(view: leftArrowView)
        //        cornerRadiusAndShodowForArrows(view: rightArrowView)
    }
    func showDoctorDates() {
        
        datesCollectionView.reloadData()
        if presenter.getDoctorDatesCount() == 0
        {
            datesCollectionViewHeightConstraint.constant = 80
        }
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    @objc func handleGoToLocationTab(_ sender: UITapGestureRecognizer? = nil) {
        
        openGoogleMap(lat: lat ?? "", lng: lng ?? "")
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
    func showDoctorDetails(doctorDetails: DoctorDetails) {
        watingTimeLbl.text = doctorDetails.waitingTime
        costLbl.text = doctorDetails.price
        lat = doctorDetails.lat
        lng = doctorDetails.lng
        totalRating.rating = Double(doctorDetails.rating!)!
        numberOfSeenLbl.text = doctorDetails.vistorNumber! + " Seen".localized
        doctorImageView.kf.setImage(with: URL(string: doctorDetails.photo!))
        //        numberOfRaitings.text = " Overall Rating From ".localized + doctorDetails.vistorNumber! + " Visitor ".localized
        numberOfVisitorsLbl.layer.cornerRadius = 5.0
        numberOfVisitorsLbl.clipsToBounds = true
        numberOfVisitorsLbl.text =  " Overall Rating From ".localized + doctorDetails.vistorNumber! + " Visitor ".localized
        numberOfVisitorsLbl.padding(2, 2, 2, 2)
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            aboutDoctorLbl.text = doctorDetails.aboutDoctorEn
            doctorNameLbl.text = doctorDetails.doctorFirstNameEn! +  doctorDetails.doctorLastNameEn!
            cityNameLbl.text = doctorDetails.addressEn
            profissionalTitleLbl.text = doctorDetails.profissionalTitleEn
            
            
        }else
        {
            profissionalTitleLbl.text = doctorDetails.profissionalTitleAr
            doctorNameLbl.text = doctorDetails.doctorFirstNameAr! + " " + doctorDetails.doctorLastNameAr!
            aboutDoctorLbl.text = doctorDetails.aboutDoctorAr
            cityNameLbl.text = doctorDetails.addressAr
            
        }
        
        ratingsCollectionView.reloadData()
        
        if presenter.getRatingsCount() == 0
        {
            ratingsCollectionViewHeightConstraint.constant = 80
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
    func cornerRadiusAndShodowForArrows(view:UIView)  {
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 3
    }
    func showError(error: String) {
        
    }
    
    func showNoDataFoundImage() {
        
    }
    @objc func moreOrLessLblDidTapped(_ sender: UITapGestureRecognizer? = nil)
    {
        if moreAndLessLbl.text == "more" || moreAndLessLbl.text == "المزيد"{
            aboutDoctorLbl.numberOfLines = 0
            aboutDoctorLbl.sizeToFit()
            print(aboutDoctorLbl.bounds.height)
            aboutDoctorViewHeight.constant = aboutDoctorLbl.bounds.height + 80
            cornerRadiusAndShodow(view: aboutDoctorView)
            moreAndLessLbl.text = "less".localized
        }else{
            aboutDoctorLbl.numberOfLines = 1
            aboutDoctorLbl.sizeToFit()
            aboutDoctorViewHeight.constant = 110
            cornerRadiusAndShodow(view: aboutDoctorView)
            moreAndLessLbl.text = "more".localized
        }
    }
    
    
    @IBAction func addDoctorToFavoriteBtnDidTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        arrayOfSavedIds = defaults.stringArray(forKey: "arrayOfSavedIds") ?? [String]()
        
        if (arrayOfSavedIds.contains(doctorId!)){
            arrayOfSavedIds = arrayOfSavedIds.filter(){$0 != doctorId}
            UserDefaults.standard.set(arrayOfSavedIds, forKey: "arrayOfSavedIds")
            addDoctorToFavoriteBtn.setImage(UIImage(named: "hart_border"), for: .normal)
            
        }else{
            arrayOfSavedIds.append(doctorId!)
            UserDefaults.standard.set(arrayOfSavedIds, forKey: "arrayOfSavedIds")
            addDoctorToFavoriteBtn.setImage(UIImage(named: "heart_solid"), for: .normal)
            
        }
        
    }
    
    
}
extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
