//
//  SearchByPharmacyNameTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/24/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import Kingfisher
class SearchByPharmacyNameTableViewCell: UITableViewCell,PharmacyOfferTableViewCellViewProtocol {
    
    @IBOutlet weak var containerView: DropShadowView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var pharmacyNameLbl: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var pharmacyPhoto: UIImageView!
    var topInset: CGFloat = 0
    var leftInset: CGFloat = 0
    var bottomInset: CGFloat = 0
    var rightInset: CGFloat = 0
    let cornerRadius : CGFloat = 25.0
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pharmacyPhoto.layer.cornerRadius = pharmacyPhoto.frame.width / 2
        pharmacyPhoto.layer.borderWidth = 1
        pharmacyPhoto.layer.borderColor = UIColor.black.cgColor
        
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        containerView.layer.shadowRadius = 15.0
        containerView.layer.shadowOpacity = 0.9
        
        
        backView.layer.cornerRadius = cornerRadius
        backView.clipsToBounds = true
    }
    
    
    func configure(offer: PharmacyOffer) {
        photo.kf.setImage(with: URL(string: offer.photo!))
        pharmacyPhoto.kf.setImage(with: URL(string: offer.pharmacyPhoto!))
        pharmacyNameLbl.text = offer.pharamcyNameEn
        typeLbl.text = offer.titleEn
        priceLbl.text = offer.price
        
        
    }
    
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
}


