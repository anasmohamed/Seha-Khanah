//
//  FavoriteOffersPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/18/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class FavoriteOffersPresenter {
    private let favoriteOffersInteractor:FavoriteOffersInteractor
       private var offersDetails: [OfferDetails]
       private weak var view: FavoriteOffesProtocol?
       init(view: FavoriteOffesProtocol) {
           self.view = view
           self.favoriteOffersInteractor = FavoriteOffersInteractor()
           offersDetails = [OfferDetails]()
       }
       
       func showDoctorBy(id:String,count:Int) {
           
           view?.showIndicator()
           favoriteOffersInteractor.showOfferDetails(id:id){ (result,error)  in
               if let error = error {
                   print("errrror\(error)")
                   self.view?.showError(error: error.localizedDescription)
               } else {
                   if result != nil{
                       
                       self.offersDetails.append(result!)
                       if self.offersDetails.count == count{
                        self.view?.getFavoriteOffersSuccess()
                       }
                       
                   }else if count == 0{
                       self.view?.showNoDataFoundImage()
                   }
                   
                   
               }
               
           }
       }
       func returnDoctorCount() -> Int {
           return offersDetails.count
       }
       func configure(cell: MostOrderedOffersTableViewCellView, for index: Int) {
           
           let offer = offersDetails[index]
           
        cell.configureWithOfferDetails(offerDetails: offer)
       }
}
