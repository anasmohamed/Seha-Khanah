//
//  MyAppointmentsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 1/13/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class MyAppointmentsPresenter {
    private let myAppointmentsInteractor:MyAppointmentsInteractor
    private var myAppointments: [MyAppiontments]
    private weak var view: MyAppointmentsProtocol?
    
    init(view: MyAppointmentsProtocol) {
        self.view = view
        self.myAppointmentsInteractor = MyAppointmentsInteractor()
        self.myAppointments = [MyAppiontments]()
    }
    
    func getMyAppintments() {
        
        view?.showIndicator()
        myAppointmentsInteractor.getMyAppointments(){ (result,error)  in
            if let error = error {
                print("errrror  \(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    self.myAppointments = result!
                    print("get my bookings result \(result)")
                    self.view?.getMyAppointmentsSuccess()                }
                
            }
            
        }
    }
    
    func cancelBooking(id:String) {
        
        view?.showIndicator()
        myAppointmentsInteractor.cancelBooking(id:id){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    self.view?.getMyAppointmentsSuccess()

                }
            }
        }
    }
    func getMyAppointmentsCount() -> Int {
        return myAppointments.count
    }
    
    
    func configure(cell: MyAppointmentsTebleViewCellPrototol, for index: Int) {
        let appointment = myAppointments[index]
        
            cell.configure(appintment:appointment )
            
        
    }
    
}

