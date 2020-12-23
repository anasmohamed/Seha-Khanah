//
//  SearchResultTableViewCell.swift
//  Seha Khanah
//
//  Created by Anas on 12/22/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher
class SearchResultTableViewCell: UITableViewCell,SearchedResultsTableViewCellView {
   
    @IBOutlet weak var doctorPhoto: UIImageView!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var watingTimeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var aboutDoctorLbl: UILabel!
    @IBOutlet weak var numberOfVotes: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var profissionalTitleEnLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }


    func configure(result:SearchedResults) {
        doctorPhoto.kf.setImage(with: URL(string: result.photo!))
        watingTimeLbl.text = result.waitingTime
        costLbl.text = result.price
        doctorNameLbl.text = result.firstNameEn!  + result.lastNameEn!
        aboutDoctorLbl.text = result.aboutDoctorEn
        numberOfVotes.text = result.numberOfVisitor
        profissionalTitleEnLbl.text = result.profissionalTitleEn
        rating.rating = Double(result.rating!)!
       }
       
}
