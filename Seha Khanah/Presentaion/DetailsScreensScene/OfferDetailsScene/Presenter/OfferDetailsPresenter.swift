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
                    self.view?.showOfferDetails(doctorDetails: self.offerDetails!)
                   }
                   
               }
               
           }
       }
       
}
