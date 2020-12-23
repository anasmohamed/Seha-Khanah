//
//  SearchBySpcialtyTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/23/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class SearchBySpcialtyTableViewCell: UITableViewCell,SearchBySpeialtyTableViewCellView{
    
    @IBOutlet weak var spcialtyImageView: UIImageView!
    @IBOutlet weak var spcialtyTitleLbl: UILabel!

 
    func configure(result:SearchBySpecialtyModel){
        spcialtyImageView.kf.setImage(with: URL(string: result.photo!))
        spcialtyTitleLbl.text = result.nameEn
    }

}
