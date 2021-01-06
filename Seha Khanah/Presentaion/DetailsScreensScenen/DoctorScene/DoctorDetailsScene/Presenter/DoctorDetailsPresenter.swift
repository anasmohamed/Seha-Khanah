//
//  DoctorDetailsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class DoctorDetailsPresenter {
    private let doctorDetailsInteractor:DoctorDetailsInteractor
    private var doctorDetails: DoctorDetails?
    private var doctorDates: [LabDate]?
    
    private weak var view: DoctorDetailsProtocol?
    init(view: DoctorDetailsProtocol) {
        self.view = view
        self.doctorDetailsInteractor = DoctorDetailsInteractor()
        doctorDetails = DoctorDetails()
        doctorDates = [LabDate]()
    }
    
    func showDoctorDetails(id:String) {
        view?.showIndicator()
        doctorDetailsInteractor.showDoctorDetails(id: id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    
                    
                    self.doctorDetails = result!
                    self.view?.showDoctorDetails(doctorDetails: self.doctorDetails!)
                }
                
            }
            
        }
    }
    
    func showDoctorDates(id:String) {
        view?.showIndicator()
        doctorDetailsInteractor.showDoctorDates(id: id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.doctorDates = result!
                    self.view?.showDoctorDates()
                }
                
            }
            
        }
    }
    func getDoctorDatesCount()->Int{
        return doctorDates!.count
    }
    func getLabDetails() ->DoctorDetails{
        return doctorDetails!
    }
    
    func getRatingsCount() -> Int {
        return (doctorDetails?.ratingsList.count)!
    }
    
    
    
    
    func configure(cell: BookingDatesCollectionViewCellProtocol, for index: Int) {
        let date = doctorDates![index]
        cell.configure(date:date)
    }
    func configure(cell: RatingCollectionViewCellPrortocol, for index: Int) {
        let labRating = doctorDetails?.ratingsList[index]
        cell.configure(labRating: labRating!)
    }
    
}
