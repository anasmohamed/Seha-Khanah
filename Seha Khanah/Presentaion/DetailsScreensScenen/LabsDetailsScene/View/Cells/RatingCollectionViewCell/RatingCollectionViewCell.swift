//
//  RatingCollectionViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 1/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
class RatingCollectionViewCell: UICollectionViewCell,RatingCollectionViewCellPrortocol {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var containerView: DropShadowView!
    
    let cornerRadius : CGFloat = 10.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        containerView.layer.shadowRadius = 5.0
        containerView.layer.shadowOpacity = 0.9
        
        backView.layer.cornerRadius = cornerRadius
        backView.clipsToBounds = true
    }
    
    func configure(labRating: LabRatings) {
        rating.rating = Double(labRating.rate!)!
        personName.text = labRating.personName
        comment.text = labRating.comment
        date.text = labRating.date
    }
    
    
}
