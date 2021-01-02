//
//  LabDetails+DatesCollectionView.swift
//  Seha Khanah
//
//  Created by Anas on 1/1/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import UIKit
extension LabDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func setupCollectionView() {
        datesCollectionView.register(UINib(nibName: "BookingDatesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookingDatesCollectionViewCell")
        ratingCollectionView.register(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == datesCollectionView{
            return labDetailsPresenter.getDatesCount()
        }
        return labDetailsPresenter.getRatingsCount()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == datesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDatesCollectionViewCell", for: indexPath) as! BookingDatesCollectionViewCell
            labDetailsPresenter.configure(cell: cell, for: indexPath.row)
            return cell
        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as! RatingCollectionViewCell
            labDetailsPresenter.configure(cell: cell, for: indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        if collectionView == datesCollectionView{
            
            // First section
            width = 170
            height = 200
            return CGSize(width: width, height: height)
        }else
        {
            width = 170
            height = 150
            
            return CGSize(width: width, height: height)
        }
        
    }
    
    
    
    
}
