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
import MOLH
class SearchResultTableViewCell: UITableViewCell,SearchedResultsTableViewCellView {
    
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var doctorPhoto: UIImageView!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var watingTimeLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var aboutDoctorLbl: UILabel!
    @IBOutlet weak var numberOfVotes: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var profissionalTitleEnLbl: UILabel!
    let cornerRadius : CGFloat = 10.0
    var bookBtnActionBlock: (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        doctorPhoto.layer.cornerRadius = doctorPhoto.frame.width / 2
        bookBtn.layer.cornerRadius = 5
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        containerView.layer.shadowRadius = 10.0
        containerView.layer.shadowOpacity = 0.9
        
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
        
    }
    
    
    func configure(result:SearchedResults) {
        doctorPhoto.kf.setImage(with: URL(string: result.photo!))
        watingTimeLbl.text = "Waiting Time:".localized + result.waitingTime!
        costLbl.text = "Cost:".localized + result.price!
        
        numberOfVotes.text = result.numberOfVisitor! + " " + "visitor".localized
        rating.rating = Double(result.rating!)!
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            doctorNameLbl.text = result.firstNameEn!  + " " + result.lastNameEn!
            aboutDoctorLbl.text = result.aboutDoctorEn
            profissionalTitleEnLbl.text = result.profissionalTitleEn
            addressLbl.text = result.addressEn
            
        }else{
            doctorNameLbl.text = result.firstNameAr!  + " " + result.lastNameAr!
            aboutDoctorLbl.text = result.aboutDoctorAr
            profissionalTitleEnLbl.text = result.profissionalTitleAr
            addressLbl.text = result.addressAr
            
        }
    }
    
    @IBAction func bookBtnDidTapped(_ sender: Any) {
        bookBtnActionBlock?()
    }
    func configureWithDoctorDetails(resultDoctorDetails: DoctorDetails) {
        doctorPhoto.kf.setImage(with: URL(string: resultDoctorDetails.photo!))
        watingTimeLbl.text = "Waiting Time:".localized + resultDoctorDetails.waitingTime!
        costLbl.text = "Cost:".localized + resultDoctorDetails.price!
        
        numberOfVotes.text = resultDoctorDetails.vistorNumber! + " " + "visitor".localized
        rating.rating = Double(resultDoctorDetails.rating!)!
        if  MOLHLanguage.currentAppleLanguage() == "en"
        {
            doctorNameLbl.text = resultDoctorDetails.doctorFirstNameEn!  + " " + resultDoctorDetails.doctorLastNameEn!
            aboutDoctorLbl.text = resultDoctorDetails.aboutDoctorEn
            profissionalTitleEnLbl.text = resultDoctorDetails.profissionalTitleEn
            addressLbl.text = resultDoctorDetails.addressEn
            
        }else{
            doctorNameLbl.text = resultDoctorDetails.doctorFirstNameAr!  + " " + resultDoctorDetails.doctorLastNameAr!
            aboutDoctorLbl.text = resultDoctorDetails.aboutDoctorAr
            profissionalTitleEnLbl.text = resultDoctorDetails.profissionalTitleAr
            addressLbl.text = resultDoctorDetails.addressAr
            
        }
    }
    
    
}
