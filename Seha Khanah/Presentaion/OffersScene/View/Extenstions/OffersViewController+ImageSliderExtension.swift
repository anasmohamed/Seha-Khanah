//
//  OffersViewController+ImageSliderExtension.swift
//  Seha Khanah
//
//  Created by Anas on 12/20/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import AACarousel
import Kingfisher

extension OffersViewController : AACarouselDelegate{
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
    }
    
    func didSelectCarouselView(_ view: AACarousel, _ index: Int) {
        
    }
    //require method
     func downloadImages(_ url: String, _ index: Int) {
         
         //here is download images area
         let imageView = UIImageView()
         imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(0))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
             print(error)
             self.imageSlider.images[index] = downloadImage!
         })
         
     }
    
     
     func startAutoScroll() {
         //optional method
         imageSlider.startScrollImageView()
        imageSlider.layoutSubviews()
     }
}
