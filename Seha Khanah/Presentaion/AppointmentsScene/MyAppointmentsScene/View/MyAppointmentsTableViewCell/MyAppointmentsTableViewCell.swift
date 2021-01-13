//
//  MyAppointmentsTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class MyAppointmentsTableViewCell: UITableViewCell,MyAppointmentsTebleViewCellPrototol {
    
    @IBOutlet weak var doctorTitleUnderPhoneIconLbl: UILabel!
    @IBOutlet weak var doctorAddressLbl: UILabel!
    @IBOutlet weak var doctorTitleLbl: UILabel!
    @IBOutlet weak var dateTimeLbl: UILabel!
    @IBOutlet weak var helpStackView: UIStackView!
    @IBOutlet weak var canelStackView: UIStackView!
    @IBOutlet weak var markerPhoto: UIImageView!
    @IBOutlet weak var markerStackView: UIStackView!
    @IBOutlet weak var bellPhoto: UIImageView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var doctorPhoto: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    let locale = NSLocale.current.languageCode
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(appintment: MyAppiontments) {
        dateTimeLbl.text = appintment.bookingDate
        doctorPhoto.kf.setImage(with: URL(string: (appintment.doctor?.photo)!))
        if locale == "en"
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
