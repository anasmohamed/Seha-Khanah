//
//  DoctorDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
import ReadMoreTextView
class DoctorDetailsViewController: UIViewController,DoctorDetailsProtocol {
    @IBOutlet weak var datesView: UIView!
    @IBOutlet weak var ratingsCollectionView: UICollectionView!
    
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    @IBOutlet weak var goToLocationView: UIView!
    @IBOutlet weak var aboutDoctorTextView: ReadMoreTextView!
    
    @IBOutlet weak var aboutDoctorLbl: UILabel!
    @IBOutlet weak var doctorView: UIView!
    
    @IBOutlet weak var aboutDoctorView: UIView!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var numberOfRaitings: UILabel!
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var moreAndLessLbl: UILabel!
    @IBOutlet weak var aboutDoctorViewHeight: NSLayoutConstraint!
    @IBOutlet weak var totalRating: CosmosView!
    @IBOutlet weak var watingTimeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var profissionalTitleLbl: UILabel!
    @IBOutlet weak var numberOfSeenLbl: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    let locale = NSLocale.current.languageCode
    var isAddToFavoriteBtnTapped = false
    var arrayOfSavedIds: [String]?
    @IBOutlet weak var addDoctorToFavoriteBtn: UIButton!
    
    var doctorId : String?
    var presenter : DoctorDetailsPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DoctorDetailsPresenter(view:self)
        presenter.showDoctorDetails(id: doctorId!)
        aboutDoctorLbl.numberOfLines = 1
        let moreOrLessTap = UITapGestureRecognizer(target: self, action:#selector(moreOrLessLblDidTapped(_:)))
        
        moreAndLessLbl.addGestureRecognizer(moreOrLessTap)
        datesCollectionView.delegate = self
        datesCollectionView.dataSource = self
        ratingsCollectionView.delegate = self
        ratingsCollectionView.dataSource = self
        setupCollectionView()
        if isAddToFavoriteBtnTapped{
             addDoctorToFavoriteBtn.setImage(UIImage(named: "heart_solid"), for: .normal)
        }
        
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

    }
    func showDoctorDates() {
        
        datesCollectionView.reloadData()
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func showDoctorDetails(doctorDetails: DoctorDetails) {
        watingTimeLbl.text = doctorDetails.waitingTime
        costLbl.text = doctorDetails.price
        totalRating.rating = Double(doctorDetails.rating!)!
        numberOfSeenLbl.text = doctorDetails.vistorNumber! + " Seen".localized
        doctorImageView.kf.setImage(with: URL(string: doctorDetails.photo!))
        numberOfRaitings.text = "Overall Rating From ".localized + doctorDetails.vistorNumber! + "Visitor".localized
       
        
        
        if locale == "en"
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
       
        if isAddToFavoriteBtnTapped{
            arrayOfSavedIds = arrayOfSavedIds?.filter(){$0 != doctorId}
            UserDefaults.standard.set(arrayOfSavedIds, forKey: "arrayOfSavedIds")
            isAddToFavoriteBtnTapped = false
            addDoctorToFavoriteBtn.setImage(UIImage(named: "hart_border"), for: .normal)

        }else{
            isAddToFavoriteBtnTapped = true
            arrayOfSavedIds?.append(doctorId!)
            UserDefaults.standard.set(arrayOfSavedIds, forKey: "arrayOfSavedIds")
            addDoctorToFavoriteBtn.setImage(UIImage(named: "heart_solid"), for: .normal)

        }

    }
    
    
}
