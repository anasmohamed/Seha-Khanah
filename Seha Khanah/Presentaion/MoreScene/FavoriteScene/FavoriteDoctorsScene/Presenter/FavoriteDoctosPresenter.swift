//
//  FavoriteDoctosPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/18/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class FavoriteDoctosPresenter {
    private let favoriteDoctorsInteractor:FavoriteDoctorsInteractor
    private var doctorDetails: [DoctorDetails]
    private weak var view: FavoriteDoctorProtocol?
    init(view: FavoriteDoctorProtocol) {
        self.view = view
        self.favoriteDoctorsInteractor = FavoriteDoctorsInteractor()
        doctorDetails = [DoctorDetails]()
    }
    
    func showDoctorBy(id:String,count:Int) {
        
        view?.showIndicator()
        favoriteDoctorsInteractor.showDoctorDetails(id:id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    
                    self.doctorDetails.append(result!)
                    if self.doctorDetails.count == count{
                        self.view?.getFavoriteDoctorsSuccess()
                    }
                    
                }else if count == 0{
                    self.view?.showNoDataFoundImage()
                }
                
                
            }
            
        }
    }
    func returnDoctorCount() -> Int {
        return doctorDetails.count
    }
    func configure(cell: SearchedResultsTableViewCellView, for index: Int) {
        
        let searchedResult = doctorDetails[index]
        
        cell.configureWithDoctorDetails(resultDoctorDetails:searchedResult)
    }
    
    
    
}
