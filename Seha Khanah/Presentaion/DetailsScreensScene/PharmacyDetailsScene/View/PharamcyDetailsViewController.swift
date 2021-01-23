//
//  PharamcyDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MOLH

class PharamcyDetailsViewController: UIViewController,PharmacyDetailsProtocol {
    @IBOutlet weak var goToLocationView: UIView!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var moreOrLessBtn: UIButton!
    @IBOutlet weak var infoHeightConstarin: NSLayoutConstraint!
    @IBOutlet weak var pharmacyPhoto: UIImageView!
    @IBOutlet weak var pharmacyInfoLbl: UILabel!
    @IBOutlet weak var serviceProviderView: UIView!
    @IBOutlet weak var serviceProfiderInfoLbl: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var pharmacyNameLbl: UILabel!
    @IBOutlet weak var pharmacyNameView: UIView!
    let locale = NSLocale.current.languageCode
    var presenter : PharmacyDetailsPresenter!
    var pharmacyId: String?
    var lat : String?
    var lng : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PharmacyDetailsPresenter(view:self)
        presenter.showPharmacyDetails(id: pharmacyId!)
        let goToLocationTap = UITapGestureRecognizer(target: self, action: #selector(self.handleGoToLocationTab(_:)))
        
        goToLocationView.addGestureRecognizer(goToLocationTap)
        
        
        // Do any additional setup after loading the view.
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cornerRadiusAndShodow(view: serviceProviderView)
        cornerRadiusAndShodow(view: infoView)
        cornerRadiusAndShodow(view: pharmacyNameView)
        cornerRadiusAndShodow(view: goToLocationView)
        
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
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getPharmacyDetailsSuccess(pharmacy: PharmacyDetails) {
        pharmacyPhoto.kf.setImage(with: (URL(string: pharmacy.photo!)))
        lat = pharmacy.lat
        lng = pharmacy.lng
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            pharmacyInfoLbl.text = pharmacy.aboutEn
            pharmacyNameLbl.text = pharmacy.pharamcyNameEn
            locationLbl.text = pharmacy.addressEn
            serviceProfiderInfoLbl.text = pharmacy.doctorFirstNameEn! + " " + pharmacy.doctorLastNameEn!
            
        }else{
            pharmacyInfoLbl.text = pharmacy.aboutAr
            pharmacyNameLbl.text = pharmacy.pharmacyNameAr
            locationLbl.text = pharmacy.addressAr
            serviceProfiderInfoLbl.text = pharmacy.doctorFirstNameAr! + " " + pharmacy.doctorLastNameAr!
            
        }
    }
    
    func showError(error: String) {
        
    }
    
    @IBAction func moreOrLessBtnDidTapped(_ sender: Any) {
    
        if moreOrLessBtn.titleLabel!.text == "more" || moreOrLessBtn.titleLabel!.text == "المزيد"{
            pharmacyInfoLbl.numberOfLines = 0
            pharmacyInfoLbl.sizeToFit()
            infoHeightConstarin.constant = pharmacyInfoLbl.bounds.height + 80
            moreOrLessBtn.setTitle("less".localized, for: .normal)
            cornerRadiusAndShodow(view: infoView)
            
        }else{
            pharmacyInfoLbl.numberOfLines = 1
            pharmacyInfoLbl.sizeToFit()
            infoHeightConstarin.constant = 120
            cornerRadiusAndShodow(view: infoView)
            moreOrLessBtn.setTitle("more".localized, for: .normal)
            
        }
        
    }
}
