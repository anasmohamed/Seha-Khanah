//
//  OfferDetailsViewController.swift
//  Seha Khanah
//
//  Created by Anas on 1/20/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Cosmos
class OfferDetailsViewController: UIViewController {
    @IBOutlet weak var doctorTitleLbl: UILabel!
    
    @IBOutlet weak var doctorNameLbl: UILabel!
    @IBOutlet weak var ratingsCollectionView: UICollectionView!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var moreOrLessBtn: UIButton!
    @IBOutlet weak var datesCollectionView: UICollectionView!
    
    @IBOutlet weak var serivceProviderInfoView: UIView!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var deviceTitleLbl: UILabel!
    @IBOutlet weak var offerTitleLbl: UILabel!
    @IBOutlet weak var datesView: UIView!
    @IBOutlet weak var imageSlideShow: UIScrollView!
    @IBOutlet weak var ratingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func moreOrLessBtnDidTapped(_ sender: Any) {
    }
    
}
