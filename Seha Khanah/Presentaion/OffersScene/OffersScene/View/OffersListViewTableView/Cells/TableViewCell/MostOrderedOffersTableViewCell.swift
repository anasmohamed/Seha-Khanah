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
import MOLH

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
    
    
  
    @IBOutlet weak var deviceNameLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: DropShadowView!
    let cornerRadius : CGFloat = 5.0
    static let identifier = "MostOrderedOffersTableViewCell"
    static func nib() ->UINib{
        return UINib(nibName: "MostOrderedOffersTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.init(displayP3Red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        doctorPhotoImageVIew.layer.cornerRadius = doctorPhotoImageVIew.frame.size.width / 2
        bookNowBtn.layer.cornerRadius = 6
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        containerView.layer.shadowRadius = 5.0
        containerView.layer.shadowOpacity = 0.5
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
        
    }
    

    func configure(mostOrderedOffer: MostOrderedOffers) {
        offerPhotoImageIView.kf.setImage(with: URL(string: mostOrderedOffer.coverImage!))
        doctorPhotoImageVIew.kf.setImage(with: URL(string: mostOrderedOffer.doctorPhoto!))
        if  MOLHLanguage.currentAppleLanguage() == "en"
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
        saleLbl.text = mostOrderedOffer.priceAfterDiscount
    }
    func configureWithOfferDetails(offerDetails: OfferDetails) {
        let doctorFirstNameAr = (offerDetails.doctor?.doctorFirstNameAr!)! + " "
        let doctorFirstNameEn = (offerDetails.doctor?.doctorFirstNameEn!)! + " "
        let doctorNameEn = doctorFirstNameEn + (offerDetails.doctor?.doctorLastNameEn)!
        let doctorNameAr = doctorFirstNameAr +
            offerDetails.doctor!.doctorLastNameAr!
        offerPhotoImageIView.kf.setImage(with: URL(string: offerDetails.coverPhoto!))
        doctorPhotoImageVIew.kf.setImage(with: URL(string: (offerDetails.doctor?.photo!)!))
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            offerNameLbl.text = offerDetails.titleNameEn
            doctorNameLbl.text = doctorNameEn + "-" + offerDetails.doctor!.addressEn!
            deviceNameLbl.text = offerDetails.deviceNameEn
        }else
        {
            offerNameLbl.text = offerDetails.titleNameAr
            
            doctorNameLbl.text = doctorNameAr + "-" +
                offerDetails.doctor!.addressAr!
            
            deviceNameLbl.text = offerDetails.deviceNameAr
            
        }
        
        //    saleLbl.text = mostOrderedOffer.nameEn
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: offerDetails.price!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        discountLbl.text = "Discount ".localized + offerDetails.discount! + "%"
        offerRating.rating = Double(offerDetails.rating!)!
        priceLbl.attributedText = attributeString
        saleLbl.text = offerDetails.priceAfterDiscount
    }
    
    
}

