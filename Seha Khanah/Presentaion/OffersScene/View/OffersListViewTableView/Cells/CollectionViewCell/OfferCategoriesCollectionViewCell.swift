//
//  OfferCollectionViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/16/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class OfferCategoriesCollectionViewCell: UICollectionViewCell {
    
      
      @IBOutlet var image : UIImageView!


      static let identifier = "CategoryCollectionViewCell"
         
         static func nib() ->UINib{
             return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
         }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
      public func configure(image:String)
        {
            
//            self.image.sd_setImage(with:URL(string: image) , placeholderImage: UIImage(named: "no_image_avaliable"))
    //         self.image.sd_setImage(with:URL(string: image) , placeholderImage: UIImage(named: "7"))
        }

}
