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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
    func configure(lab: Lab) {
        
    }
    
}
