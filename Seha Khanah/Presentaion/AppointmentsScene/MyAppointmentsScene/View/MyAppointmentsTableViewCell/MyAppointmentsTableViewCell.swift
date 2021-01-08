//
//  MyAppointmentsTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 1/8/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class MyAppointmentsTableViewCell: UITableViewCell {
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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
