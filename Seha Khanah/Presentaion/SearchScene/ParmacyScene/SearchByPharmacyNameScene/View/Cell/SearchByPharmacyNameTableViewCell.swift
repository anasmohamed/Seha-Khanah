//
//  SearchByPharmacyNameTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchByPharmacyNameTableViewCell: UITableViewCell,PharmacyOfferTableViewCellViewProtocol {
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var pharmacyNameLbl: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var pharmacyPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(offer: PharmacyOffer) {
    
    }
   
    
}
