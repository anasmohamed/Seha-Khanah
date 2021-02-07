//
//  BookingDatesCollectionViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import MOLH

class BookingDatesCollectionViewCell: UICollectionViewCell ,BookingDatesCollectionViewCellProtocol{
  
    
   
    
    
    @IBOutlet weak var containerView: DropShadowView!
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var startHourLbl: UILabel!
    @IBOutlet weak var endHourLbl: UILabel!
    @IBOutlet weak var bookNowBtn: UIButton!
    let cornerRadius : CGFloat = 5.0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        bookNowBtn.layer.cornerRadius = 5
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowRadius = 5.0
        containerView.layer.shadowOpacity = 0.9
        
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
    }
    
    
    @IBAction func bookNowBtnDidTapped(_ sender: Any) {
    }
    func configure(date: LabDate) {
        startHourLbl.text = date.startTime
        endHourLbl.text = date.endTime
        dateLbl.text = date.date
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            dayLbl.text = date.dayEn
            
        }else
        {
            dayLbl.text = date.dayAr

        }
        
    }
}
