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
    
    @IBOutlet weak var cancelView: UIImageView!
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
    var helpRequestActionBlock: (() -> Void)? = nil

    var lat : String?
    var longtiude : String?
    var bookingId:String?
    override func awakeFromNib() {
        super.awakeFromNib()
        doctorPhoto.layer.cornerRadius = doctorPhoto.frame.width / 2
        bellView.layer.cornerRadius = bellView.frame.width / 2
        bellView.layer.borderColor = UIColor.blue.cgColor
        bellView.layer.borderWidth = 1
        mabMarkerView.layer.cornerRadius = bellView.frame.width / 2
        mabMarkerView.layer.borderColor = UIColor.blue.cgColor
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
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            doctorNameLbl.text = (appintment.doctor?.doctorFirstNameEn)! + " " + (appintment.doctor?.doctorLastNameEn)!
            doctorTitleLbl.text = appintment.doctor?.profissionalTitleEn
            doctorAddressLbl.text = appintment.doctor?.addressEn
            doctorTitleUnderPhoneIconLbl.text = appintment.doctor?.profissionalTitleEn
            
        }else
        {
            doctorNameLbl.text = (appintment.doctor?.doctorFirstNameAr)! + " " + (appintment.doctor?.doctorLastNameAr)!
            doctorTitleLbl.text = appintment.doctor?.profissionalTitleAr
            doctorAddressLbl.text = appintment.doctor?.addressAr
            doctorTitleUnderPhoneIconLbl.text = appintment.doctor?.profissionalTitleAr
            
            
        }
    }
    
    
}
