////
////  OffersTableViewCell.swift
////  Seha Khanah
////
////  Created by Anas on 12/16/20.
////  Copyright © 2020 Anas. All rights reserved.
////
//
import UIKit
import Cosmos
import Kingfisher
class MostOrderedOffersTableViewCell:UITableViewCell,MostOrderedOffersTableViewCellView {
    
    
    @IBOutlet weak var offerPhotoImageIView: UIImageView!
    
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var doctorPhotoImageVIew: UIImageView!
    @IBOutlet weak var discountLbl: UILabel!
    
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var saleLbl: UILabel!
    @IBOutlet weak var offerRating: CosmosView!
    @IBOutlet weak var offerDetailsLbl: UILabel!
    @IBOutlet weak var offerNameLbl: UILabel!
    

    static let identifier = "MostOrderedOffersTableViewCell"
    static func nib() ->UINib{
        return UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        doctorPhotoImageVIew.layer.cornerRadius = doctorPhotoImageVIew.frame.size.width / 2

    }
   func configure(mostOrderedOffer: MostOrderedOffers) {
    offerPhotoImageIView.kf.setImage(with: URL(string: "https://example.com/image.png"))
    doctorNameLbl.text = mostOrderedOffer.nameEn
    doctorPhotoImageVIew.kf.setImage(with: URL(string: "https://example.com/image.png"))
    saleLbl.text = mostOrderedOffer.nameEn
    
    
   }

}

