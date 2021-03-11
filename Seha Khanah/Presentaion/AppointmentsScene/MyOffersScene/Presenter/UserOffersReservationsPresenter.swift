//
//  UserOffersReservationsInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/23/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class UserOffersReservationsPresenter {
    private let userOffersReservationsInteractor:UserOffersReservationsInteractor
    private var myOffers: [MyAppiontments]
    private weak var view: UserOffersReservationsProtocol?
    
    init(view: UserOffersReservationsProtocol) {
        self.view = view
        self.userOffersReservationsInteractor = UserOffersReservationsInteractor()
        self.myOffers = [MyAppiontments]()
    }
    
    func getMyOffers() {
        
        view?.showIndicator()
        userOffersReservationsInteractor.getMyOffers(){ (result,error)  in
            if let error = error {
                print("errrror  \(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    self.myOffers = result!
                    print("get my bookings result \(result)")
                    self.view?.getMyOffersSuccess()
                    
                }
                
            }
            
        }
    }
    
    func cancelBooking(id:String) {
        
        view?.showIndicator()
        userOffersReservationsInteractor.cancelBooking(id:id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    self.view?.cancelReservationSuccess()
                    
                }
            }
        }
    }
    func getMyOffersCount() -> Int {
        return myOffers.count
    }
    func getAppointmentStatus(index:Int)-> String{
        print("status id \(myOffers[index].statusId!)")
        return myOffers[index].statusId!
    }
    
    func configure(cell: MyAppointmentsTebleViewCellPrototol, for index: Int) {
        let offer = myOffers[index]
        
        cell.configure(appintment:offer )
        
        
    }
}
