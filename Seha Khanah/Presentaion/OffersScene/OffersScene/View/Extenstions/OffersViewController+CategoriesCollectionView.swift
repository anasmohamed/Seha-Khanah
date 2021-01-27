//
//  OffersViewController+CategoriesCollectionView.swift
//  Seha Khanah
//
//  Created by Anas on 12/20/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
import UIKit
extension OffersViewController :UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func setupCollectionView() {
        offersCategoriesCollectionView.register(UINib(nibName: "OfferCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferCategoriesCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0
        {
            return  1
        }
        return presenter.getOffersCategoriesCount() - 1
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCategoriesCollectionViewCell.identifier, for: indexPath) as! OfferCategoriesCollectionViewCell
        cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        presenter.configure(cell: cell, for: indexPath.row,section:indexPath.section)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        
        if indexPath.section == 0 {
            // First section
            width = 150
            height = 150
            return CGSize(width: width, height: height)
        } else {
            // Second section
            width = 120
            height = (collectionView.frame.size.height / 2)
            return CGSize(width: width, height: height)
        }
        
        
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        if section == 1{
    //            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    //        }else{
    //            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    //
    //        }
    //    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offerSubCategoryViewController = UIStoryboard.init(name: "OffersForSpecificCategory", bundle: nil).instantiateViewController(withIdentifier: "OffersForSpcificCategoryTableViewController") as! OffersForSpcificCategoryTableViewController
        print("section \(indexPath.section)")
        if indexPath.section == 0{
            offerSubCategoryViewController.id = presenter.getOfferId(index: indexPath.row)
        }
        else{
            offerSubCategoryViewController.id = presenter.getOfferId(index: indexPath.row + 1)
            
        }
        print(presenter.getOfferId(index: indexPath.row))
        self.navigationController!.pushViewController(offerSubCategoryViewController, animated: true)
    }
    //    func collectionViewLayoutInsets()  {
    //        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    //                     layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    //
    //        layout.scrollDirection = .horizontal
    //        //        layout.itemSize = CGSize(width: 90, height: 90)
    //        layout.minimumInteritemSpacing = 5
    //        layout.minimumLineSpacing = 5
    //        offersCategoriesCollectionView.collectionViewLayout = layout
    //    }
}
