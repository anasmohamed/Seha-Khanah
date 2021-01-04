//
//  TimeCollectionViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 1/3/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit

class TimeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLbl : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
}
