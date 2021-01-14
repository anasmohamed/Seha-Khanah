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
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.showDoctorDates(id: doctorId!)
        cornerRadiusAndShodow(view: doctorView)
        cornerRadiusAndShodow(view: aboutDoctorView)
        cornerRadiusAndShodow(view: ratingView)
        cornerRadiusAndShodow(view: datesView)
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
        doctorNameLbl.text = doctorDetails.doctorFirstNameEn! +  doctorDetails.doctorLastNameEn!
        profissionalTitleLbl.text = doctorDetails.profissionalTitleEn
        
        
        if locale == "en"
        {
            aboutDoctorLbl.text = doctorDetails.aboutDoctorEn
            
            cityNameLbl.text = doctorDetails.addressEn
            
        }else
        {
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
        aboutDoctorLbl.numberOfLines = 0
        aboutDoctorLbl.sizeToFit()
        aboutDoctorViewHeight.constant = 200
        cornerRadiusAndShodow(view: aboutDoctorView)
        
        
    }
    
}
