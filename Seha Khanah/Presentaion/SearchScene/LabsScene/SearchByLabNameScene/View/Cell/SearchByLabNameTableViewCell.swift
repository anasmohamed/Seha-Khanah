//
//  SearchByLabNameTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/25/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import Cosmos
class SearchByLabNameTableViewCell: UITableViewCell,SearchByLabNameTableViewCellProtocol {
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var accountPhoto: UIImageView!
    @IBOutlet weak var labPhoto: UIImageView!
    @IBOutlet weak var containerView: DropShadowView!
    let locale = NSLocale.current.languageCode
    
    let cornerRadius : CGFloat = 25.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookNowBtn.layer.cornerRadius = 10
        accountPhoto.layer.cornerRadius = accountPhoto.frame.width / 2
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        containerView.layer.shadowRadius = 15.0
        containerView.layer.shadowOpacity = 0.9
        
        
        backView.layer.cornerRadius = cornerRadius
        backView.clipsToBounds = true
        
    }
    
    
    func configure(lab: Lab) {
        ratingView.rating = Double(lab.rating!)!
        labPhoto.kf.setImage(with: URL(string:lab.photo!))
        accountPhoto.kf.setImage(with: URL(string:lab.photo!))
        if locale == "en"{
            labName.text = lab.labNameEn
            addressLbl.text = lab.addressEn
        }else{
            labName.text = lab.labNameAr
            addressLbl.text = lab.addressAr
        }
    }
    
}
