//
//  PharamcyDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class PharamcyDetailsViewController: UIViewController,PharmacyDetailsProtocol {
    @IBOutlet weak var goToLocationView: UIView!
    
    @IBOutlet weak var locationLbl: UILabel!
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PharmacyDetailsPresenter(view:self)
        presenter.showPharmacyDetails(id: pharmacyId!)
        
        
        
        // Do any additional setup after loading the view.
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
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 5
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getPharmacyDetailsSuccess(pharmacy: PharmacyDetails) {
        pharmacyPhoto.kf.setImage(with: (URL(string: pharmacy.photo!)))
        if locale == "en"
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
    
}
