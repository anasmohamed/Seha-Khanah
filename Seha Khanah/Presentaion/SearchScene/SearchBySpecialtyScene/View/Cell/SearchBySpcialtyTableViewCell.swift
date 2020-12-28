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
    let locale = NSLocale.current.languageCode

 
    func configure(result:SearchBySpecialtyModel){
        spcialtyImageView.kf.setImage(with: URL(string: result.photo!))
        if locale == "en"
        {
            spcialtyTitleLbl.text = result.nameEn

        }
        else{
            spcialtyTitleLbl.text = result.nameAr

        }
    }

}
