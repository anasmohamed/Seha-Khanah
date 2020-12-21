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
    
    @IBOutlet weak var priceLbl: UILabel!
    
    static let identifier = "MostOrderedOffersTableViewCell"
    static func nib() ->UINib{
        return UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        doctorPhotoImageVIew.layer.cornerRadius = doctorPhotoImageVIew.frame.size.width / 2

    }
   func configure(mostOrderedOffer: MostOrderedOffers) {
    offerPhotoImageIView.kf.setImage(with: URL(string: mostOrderedOffer.coverImage!))
    offerNameLbl.text = mostOrderedOffer.titleEn
    doctorPhotoImageVIew.kf.setImage(with: URL(string: mostOrderedOffer.doctorPhoto!))
//    saleLbl.text = mostOrderedOffer.nameEn
    doctorNameLbl.text = mostOrderedOffer.doctorFristNameEn! + " " + mostOrderedOffer.doctorLastNameEn!
    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: mostOrderedOffer.price!)
    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
    discountLbl.text = "Discount " + mostOrderedOffer.discount! + "%"
    offerRating.rating = Double(mostOrderedOffer.rating!)!
    priceLbl.attributedText = attributeString
    saleLbl.text = String(Double(mostOrderedOffer.price!)! * Double(mostOrderedOffer.discount!)! / 100)
    
    
    
    
    
   }

}

