//
//  LabDetailsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 12/31/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation
class LabDetailsPresenter {
    private let labDetailsInteractor:LabDetailsInteractor
    private var labDetails: LabDetails?
    private weak var view: LabDetailsProtocol?
    init(view: LabDetailsProtocol) {
        self.view = view
        self.labDetailsInteractor = LabDetailsInteractor()
        labDetails = LabDetails()
    }
    
    func showLabDetails(id:String) {
        view?.showIndicator()
        labDetailsInteractor.showLabDetails(id: id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    
                    
                    self.labDetails = result!
                    self.view?.showLabDetails(labDetails: self.labDetails!)
                }
                
            }
            
        }
    }
    
    func getLabDetails() ->LabDetails{
        return labDetails!
    }
    func getDatesCount() -> Int {
        return (labDetails?.datesList.count)!
    }
    func getRatingsCount() -> Int {
        return (labDetails?.ratingsList.count)!
    }
    func getLabServices() -> [LabServices] {
        return labDetails!.labServicesList
    }
    func getLabDates(index:Int) -> LabDate {
        return (labDetails?.datesList[index])!
    }
    
    func configure(cell: BookingDatesCollectionViewCellProtocol, for index: Int) {
        cell.configure(labDates: (labDetails?.dates)!)
    }
    func configure(cell: RatingCollectionViewCellPrortocol, for index: Int) {
        let labRating = labDetails?.ratingsList[index]
        cell.configure(labRating: labRating!)
    }
    
}
