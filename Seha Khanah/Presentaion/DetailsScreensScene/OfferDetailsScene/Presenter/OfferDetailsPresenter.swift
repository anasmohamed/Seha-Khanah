//
//  OfferDetailsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/20/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class OfferDetailsPresenter {
    private let offerDetailsInteractor:OfferDetailsInteractor
       private var offerDetails: OfferDetails?
       
       private weak var view: OfferDetailsProtocol?
       init(view: OfferDetailsProtocol) {
           self.view = view
           self.offerDetailsInteractor = OfferDetailsInteractor()
           offerDetails = OfferDetails()
          
       }
       
       func showDoctorDetails(id:String) {
           view?.showIndicator()
           offerDetailsInteractor.showOfferDetails(id: id){ (result,error)  in
               if let error = error {
                   print("errrror\(error)")
                   self.view?.showError(error: error.localizedDescription)
               } else {
                   if result != nil{
                       
                       
                       self.offerDetails = result!
                    self.view?.showOfferDetails(offerDetails: self.offerDetails!)
                   }
                   
               }
               
           }
       }
    func getDates() -> [LabDate] {
        return offerDetails!.datesList
    }
    func getRatings() -> [LabRatings] {
        return offerDetails!.ratingsList
    }
    func getOfferPhoto() -> String {
        return (offerDetails?.photo)!
    }
    func getTimes(index:Int) -> [Time] {
        return offerDetails!.datesList[index].timesList
    }
    func configure(cell: BookingDatesCollectionViewCellProtocol, for index: Int) {
        let date = offerDetails?.datesList[index]
        cell.configure(date:date!)
    }
    func configure(cell: RatingCollectionViewCellPrortocol, for index: Int) {
        let labRating = offerDetails?.ratingsList[index]
        cell.configure(labRating: labRating!)
    }
       
}
