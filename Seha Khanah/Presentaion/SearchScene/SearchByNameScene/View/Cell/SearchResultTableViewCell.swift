//
//  SearchResultTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell,SearchedResultsTableViewCellView {
   

    
    @IBOutlet weak var searchResultImageView:UIImageView!
    @IBOutlet weak var searchResultLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    func configure(image: String, name: String) {
        searchResultImageView.kf.setImage(with: URL(string: image))
        searchResultLbl.text = name
       }
       
}
