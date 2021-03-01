//
//  MyAppointmentsTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MOLH

class MyAppointmentsTableViewCell: UITableViewCell,MyAppointmentsTebleViewCellPrototol {
    
    @IBOutlet weak var cancelImageView: UIImageView!
    @IBOutlet weak var cancelLbl: UILabel!
    @IBOutlet weak var cancelView: UIView!
    @IBOutlet weak var bellView: UIView!
    @IBOutlet weak var doctorTitleUnderPhoneIconLbl: UILabel!
    @IBOutlet weak var doctorAddressLbl: UILabel!
    @IBOutlet weak var doctorTitleLbl: UILabel!
    @IBOutlet weak var dateTimeLbl: UILabel!
    @IBOutlet weak var mabMarkerView: UIView!
    @IBOutlet weak var markerPhoto: UIImageView!
    @IBOutlet weak var bellPhoto: UIImageView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var doctorPhoto: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    let cornerRadius : CGFloat = 10.0
    var actionBlock: (() -> Void)? = nil
    var mapStackViewActionBlock: (() -> Void)? = nil
    @IBOutlet weak var cacelView: UIView!
    var helpRequestActionBlock: (() -> Void)? = nil
    
    @IBOutlet weak var visitingStatusLbl: UILabel!
    var lat : String?
    var longtiude : String?
    var bookingId : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        doctorPhoto.layer.cornerRadius = doctorPhoto.frame.width / 2
        bellView.layer.cornerRadius = bellView.frame.width / 2
        cancelView.layer.cornerRadius = cancelView.frame.width / 2
        
        bellView.layer.borderColor = UIColor.init(red: 25.0/255.0, green: 76.0/255.0, blue: 121.0/255.0, alpha: 1).cgColor
        bellView.layer.borderWidth = 1
        cancelView.layer.borderColor = UIColor.init(red: 25.0/255.0, green: 76.0/255.0, blue: 121.0/255.0, alpha: 1).cgColor
        cancelView.layer.borderWidth = 1
        mabMarkerView.layer.cornerRadius = bellView.frame.width / 2
        mabMarkerView.layer.borderColor = UIColor.init(red: 25.0/255.0, green: 76.0/255.0, blue: 121.0/255.0, alpha: 1).cgColor
        mabMarkerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        containerView.layer.shadowRadius = 10.0
        containerView.layer.shadowOpacity = 0.7
        
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
        
        
        
        let cencelRequestTab = UITapGestureRecognizer(target: self, action: #selector(self.handleCancelRequestTab(_:)))
        cancelView.addGestureRecognizer(cencelRequestTab)
        
        let mapRequestTab = UITapGestureRecognizer(target: self, action: #selector(self.handleMapRequestTab(_:)))
        mabMarkerView.addGestureRecognizer(mapRequestTab)
        let helpRequestTab = UITapGestureRecognizer(target: self, action: #selector(self.handleHelpRequestTab(_:)))
        bellView.addGestureRecognizer(helpRequestTab)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @objc func handleCancelRequestTab(_ sender: UITapGestureRecognizer? = nil)
    {
        actionBlock?()
        
    }
    @objc func handleMapRequestTab(_ sender: UITapGestureRecognizer? = nil)
    {
        mapStackViewActionBlock?()
        
    }
    @objc func handleHelpRequestTab(_ sender: UITapGestureRecognizer? = nil)
    {
        helpRequestActionBlock?()
        
    }
    func configure(appintment: MyAppiontments) {
        bookingId = appintment.id
        dateTimeLbl.text = appintment.bookingDate
        doctorPhoto.kf.setImage(with: URL(string: (appintment.doctor?.photo)!))
        lat = appintment.doctor!.lat
        longtiude = appintment.doctor!.lng
//        switch appintment.statusId {
//        case "1":
//            visitingStatusLbl.text = "The reservation was successful and the visit did not take place yet".localized
//        case "2":
//            visitingStatusLbl.text = "Reservation canceled".localized
//
//        case "3":
//            visitingStatusLbl.text = "Visited".localized
//
//        default:
//            break
//        }
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            doctorNameLbl.text = (appintment.doctor?.doctorFirstNameEn)! + " " + (appintment.doctor?.doctorLastNameEn)!
            doctorTitleLbl.text = appintment.doctor?.profissionalTitleEn
            doctorAddressLbl.text = appintment.doctor?.addressEn
            doctorTitleUnderPhoneIconLbl.text = appintment.doctor?.profissionalTitleEn
            visitingStatusLbl.text = appintment.status?.nameEn
            
        }else
        {
            doctorNameLbl.text = (appintment.doctor?.doctorFirstNameAr)! + " " + (appintment.doctor?.doctorLastNameAr)!
            doctorTitleLbl.text = appintment.doctor?.profissionalTitleAr
            doctorAddressLbl.text = appintment.doctor?.addressAr
            doctorTitleUnderPhoneIconLbl.text = appintment.doctor?.profissionalTitleAr
            visitingStatusLbl.text = appintment.status?.nameAr

            
        }
    }
    
    
}
