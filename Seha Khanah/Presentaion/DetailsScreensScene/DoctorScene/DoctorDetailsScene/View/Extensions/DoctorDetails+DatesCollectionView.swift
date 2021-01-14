//
//  DoctorDetails+DatesCollectionView.swift
//  Seha Khanah
//
//  Created by Anas on 1/6/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation

import UIKit
extension DoctorDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func setupCollectionView() {
        datesCollectionView.register(UINib(nibName: "BookingDatesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookingDatesCollectionViewCell")
        ratingsCollectionView.register(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == datesCollectionView{
            return presenter.getDoctorDatesCount()
        }
        return presenter.getRatingsCount()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "LabDayDates", bundle:nil )
        let labDayDatesViewController = storyboard.instantiateViewController(withIdentifier: "LabDayDatesViewController") as! LabDayDatesViewController
        labDayDatesViewController.times = presenter.getTimes(index: indexPath.row)
        labDayDatesViewController.labName = doctorNameLbl.text
        labDayDatesViewController.labPhoto = presenter.getDoctorPhoto()
        labDayDatesViewController.labDate = presenter.getDoctorDate(index: indexPath.row)
        labDayDatesViewController.labId = doctorId
        labDayDatesViewController.isDoctor = true
        labDayDatesViewController.doctorCost = presenter.getDoctorCost()
        labDayDatesViewController.profissionalTitle = profissionalTitleLbl.text

        labDayDatesViewController.labAddress = cityNameLbl.text
        self.navigationController!.pushViewController(labDayDatesViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == datesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDatesCollectionViewCell", for: indexPath) as! BookingDatesCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as! RatingCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        if collectionView == datesCollectionView{
            
            // First section
            width = 200
            height = 150
            return CGSize(width: width, height: height)
        }else
        {
            width = 200
            height = 200
            
            return CGSize(width: width, height: height)
        }
        
    }
    
    
    
    
}
