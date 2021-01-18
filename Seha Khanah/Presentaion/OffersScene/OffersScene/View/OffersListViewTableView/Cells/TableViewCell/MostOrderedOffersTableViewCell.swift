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
    
    
    var topInset: CGFloat = 30
    var leftInset: CGFloat = 30
    var bottomInset: CGFloat = 0
    var rightInset: CGFloat = 30
    
    @IBOutlet weak var deviceNameLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: DropShadowView!
    let cornerRadius : CGFloat = 10.0
    let locale = NSLocale.current.languageCode
    static let identifier = "MostOrderedOffersTableViewCell"
    static func nib() ->UINib{
        return UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        doctorPhotoImageVIew.layer.cornerRadius = doctorPhotoImageVIew.frame.size.width / 2
        bookNowBtn.layer.cornerRadius = 5
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        containerView.layer.shadowRadius = 5.0
        containerView.layer.shadowOpacity = 0.9
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
        
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        self.layoutMargins = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    override func layoutSubviews() {
        // cell rounded section
        super.layoutSubviews()
//        self.layer.cornerRadius = 15.0
//        self.layer.borderWidth = 5.0
//        self.layer.borderColor = UIColor.clear.cgColor
//        self.layer.masksToBounds = true
//
//        // cell shadow section
//        self.contentView.layer.cornerRadius = 15.0
//        self.contentView.layer.borderWidth = 5.0
//        self.contentView.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.layer.masksToBounds = true
//        self.layer.shadowColor = UIColor.white.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
//        self.layer.shadowRadius = 6.0
//        self.layer.shadowOpacity = 0.6
//        self.layer.cornerRadius = 15.0
//        self.layer.masksToBounds = false
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        self.contentView.frame = self.frame.inset(by: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
        
    }
    func configure(mostOrderedOffer: MostOrderedOffers) {
        offerPhotoImageIView.kf.setImage(with: URL(string: mostOrderedOffer.coverImage!))
        doctorPhotoImageVIew.kf.setImage(with: URL(string: mostOrderedOffer.doctorPhoto!))
        if locale == "en"
        {
            offerNameLbl.text = mostOrderedOffer.titleEn
            doctorNameLbl.text = mostOrderedOffer.doctorFristNameEn! + " " + mostOrderedOffer.doctorLastNameEn! + "-" + mostOrderedOffer.addressEn!
            deviceNameLbl.text = mostOrderedOffer.deviceNameEn
        }else
        {
           offerNameLbl.text = mostOrderedOffer.titleAr
            doctorNameLbl.text = mostOrderedOffer.doctorFristNameAr! + " " + mostOrderedOffer.doctorLastNameAr! + "-" + mostOrderedOffer.addressAr!
            deviceNameLbl.text = mostOrderedOffer.deviceNameAr

        }
        
        //    saleLbl.text = mostOrderedOffer.nameEn
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: mostOrderedOffer.price!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        discountLbl.text = "Discount ".localized + mostOrderedOffer.discount! + "%"
        offerRating.rating = Double(mostOrderedOffer.rating!)!
        priceLbl.attributedText = attributeString
        saleLbl.text = String(Double(mostOrderedOffer.price!)! * Double(mostOrderedOffer.discount!)! / 100)
        
        
        
        
        
    }
    
}

