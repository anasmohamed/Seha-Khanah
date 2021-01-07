//
//  BookingPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class BookingPresenter {
    private let bookingInteractor:BookingInteractor
    private var reservationResponse = ReservationResponse()
    private weak var view: BookingProtocol?
    
    init(view: BookingProtocol) {
        self.view = view
        reservationResponse = ReservationResponse()
        self.bookingInteractor = BookingInteractor()
    }
    
    func bookLab(name : String,email:String,phoneNumber:String,bookingDate : String,labId:String,checkbox:String) {
        
        view?.showIndicator()
        bookingInteractor.labBooking(name: name, email: email, phoneNumber: phoneNumber, bookingDate: bookingDate, labId: labId, checkbox: checkbox){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.reservationResponse = result!
                    self.view?.bookingSuccess()
                }
                
            }
            
        }
    }
    
    func bookDoctor(name : String,email:String,phoneNumber:String,bookingDate : String,doctorId:String,checkbox:String) {
        
        view?.showIndicator()
        bookingInteractor.labBooking(name: name, email: email, phoneNumber: phoneNumber, bookingDate: bookingDate, labId: doctorId, checkbox: checkbox){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            } else {
                if result != nil{
                    self.reservationResponse = result!
                    self.view?.bookingSuccess()
                }
                
            }
            
        }
    }
//
//    func configure(cell: MostOrderedOffersTableViewCellView, for index: Int) {
//        print(mostOrderedOffers.count)
//        if mostOrderedOffers.count > 0{
//            let mostOrderedOffer = mostOrderedOffers[index]
//            cell.configure(mostOrderedOffer: mostOrderedOffer)
//        }
//
//    }
}
