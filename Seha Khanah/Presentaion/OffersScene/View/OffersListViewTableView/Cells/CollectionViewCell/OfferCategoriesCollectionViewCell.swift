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
   
    
    @IBOutlet var categoryImage : UIImageView!
    @IBOutlet var categoryNameLbl : UILabel!
    
    
    static let identifier = "OfferCategoriesCollectionViewCell"
    
    static func nib() ->UINib{
        return UINib(nibName: "OfferCategoriesCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(image:String,categoryName:String)
    {
        categoryNameLbl.text = categoryName
                    self.categoryImage.sd_setImage(with:URL(string: image) , placeholderImage: UIImage(named: "no_image_avaliable"))
                
    }
    
}
