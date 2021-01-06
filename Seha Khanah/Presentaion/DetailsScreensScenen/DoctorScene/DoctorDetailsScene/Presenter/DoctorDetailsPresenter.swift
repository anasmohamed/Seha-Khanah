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
    private weak var view: DoctorDetailsProtocol?
    init(view: DoctorDetailsProtocol) {
        self.view = view
        self.doctorDetailsInteractor = DoctorDetailsInteractor()
        doctorDetails = DoctorDetails()
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
    
    func getLabDetails() ->DoctorDetails{
        return doctorDetails!
    }
    
    func getRatingsCount() -> Int {
        return (doctorDetails?.ratingsList.count)!
    }
    
}


//       func configure(cell: BookingDatesCollectionViewCellProtocol, for index: Int) {
//           cell.configure(labDates: (labDetails?.dates)!)
//       }
//       func configure(cell: RatingCollectionViewCellPrortocol, for index: Int) {
//           let labRating = labDetails?.ratingsList[index]
//           cell.configure(labRating: labRating!)
//       }

