//
//  OfferCollectionViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/16/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import SDWebImage
class OfferCategoriesCollectionViewCell: UICollectionViewCell,OffersCategorisCellView {
    @IBOutlet weak var containerView: DropShadowView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet var categoryImage : UIImageView!
    @IBOutlet var categoryNameLbl : UILabel!
    
    let cornerRadius : CGFloat = 5.0
    
    static let identifier = "OfferCategoriesCollectionViewCell"
    
    static func nib() ->UINib{
        return UINib(nibName: "OfferCategoriesCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        containerView.layer.shadowRadius = 3.0
        containerView.layer.shadowOpacity = 0.5
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
    }
    //    override func layoutSubviews() {
    //           // cell rounded section
    //           self.layer.cornerRadius = 15.0
    //           self.layer.borderWidth = 5.0
    //           self.layer.borderColor = UIColor.clear.cgColor
    //           self.layer.masksToBounds = true
    //
    //           // cell shadow section
    //           self.contentView.layer.cornerRadius = 15.0
    //           self.contentView.layer.borderWidth = 5.0
    //           self.contentView.layer.borderColor = UIColor.clear.cgColor
    //           self.contentView.layer.masksToBounds = true
    //           self.layer.shadowColor = UIColor.white.cgColor
    //           self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
    //           self.layer.shadowRadius = 6.0
    //           self.layer.shadowOpacity = 0.6
    //           self.layer.cornerRadius = 15.0
    //           self.layer.masksToBounds = false
    //           self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    //       }
    public func configure(image:String,categoryName:String)
    {
        categoryNameLbl.text = categoryName
        self.categoryImage.sd_setImage(with:URL(string: image) , placeholderImage: UIImage(named: "no_image_avaliable"))
        
    }
    
}
