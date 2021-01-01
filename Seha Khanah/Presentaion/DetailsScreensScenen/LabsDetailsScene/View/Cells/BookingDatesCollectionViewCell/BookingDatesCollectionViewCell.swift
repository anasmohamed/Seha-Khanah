//
//  BookingDatesCollectionViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class BookingDatesCollectionViewCell: UICollectionViewCell ,BookingDatesCollectionViewCellProtocol{
    
    

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var startHourLbl: UILabel!
    @IBOutlet weak var endHourLbl: UILabel!
    @IBOutlet weak var bookNowBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func bookNowBtnDidTapped(_ sender: Any) {
    }
    func configure(labDates: LabDate) {
        
    }
}
