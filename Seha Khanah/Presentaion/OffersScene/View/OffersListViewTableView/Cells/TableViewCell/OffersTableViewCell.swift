////
////  OffersTableViewCell.swift
////  Seha Khanah
////
////  Created by Anas on 12/16/20.
////  Copyright © 2020 Anas. All rights reserved.
////
//
//import UIKit
//
//class OffersTableViewCell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,OffersCategorisCellView {
//
//
//    @IBOutlet weak var categriesCollectionView: UICollectionView!
//
//    static let identifier = "OffersCategoriesTableViewCell"
//    var OffersCategorisList = [OffersCategory]()
//
//    var index : Int?
//    static func nib() ->UINib{
//        return UINib(nibName: "OffersTableViewCell", bundle: nil)
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        categriesCollectionView.register(OfferCategoriesCollectionViewCell.nib(), forCellWithReuseIdentifier: OfferCategoriesCollectionViewCell.identifier)
//        categriesCollectionView.delegate = self
//        categriesCollectionView.dataSource = self
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//
//        return OffersCategorisList.count ?? 0
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCategoriesCollectionViewCell.identifier, for: indexPath) as! OfferCategoriesCollectionViewCell
//        cell.configure(image: OffersCategorisList[indexPath.item].photo!,categoryName: OffersCategorisList[indexPath.item].nameEn!)
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 260, height: 260)
//    }
//
//    func displayCategory(category:OffersCategory) {
//        self.OffersCategorisList = OffersCategory
//        categriesCollectionView.reloadData()
//
//    }
//
//
//
//}

