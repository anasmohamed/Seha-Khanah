//
//  MyLabsAppointmentsPresenter.swift
//  Seha Khanah
//
//  Created by Anas on 3/7/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class MyLabsAppointmentsPresenter {
private let myLabsAppointmentsInteractor:MyLabsAppointmentsInteractor
private var myAppointments: [MyLabAppointment]
private weak var view: MyLabsAppointmentsProtocol?

init(view: MyLabsAppointmentsProtocol) {
    self.view = view
    self.myLabsAppointmentsInteractor = MyLabsAppointmentsInteractor()
    self.myAppointments = [MyLabAppointment]()
}

func getMyAppintments() {
    
    view?.showIndicator()
    myLabsAppointmentsInteractor.getMyLabsAppointments(){ (result,error)  in
        if let error = error {
            print("errrror  \(error)")
            self.view?.showError(error: error.localizedDescription)
        }
        else {
            if result != nil{
                self.myAppointments = result!
                print("get my bookings result \(result)")
                self.view?.getMyLabsAppointmentsSuccess()
                
            }
            
        }
        
    }
}

func cancelBooking(id:String) {
    
    view?.showIndicator()
    myLabsAppointmentsInteractor.cancelBooking(id:id){ (result,error)  in
        if let error = error {
            print("errrror\(error)")
            self.view?.showError(error: error.localizedDescription)
        }
        else {
            if result != nil{
                self.view?.getMyLabsAppointmentsSuccess()

            }
        }
    }
}
func getMyAppointmentsCount() -> Int {
    return myAppointments.count
}
func getAppointmentStatus(index:Int)-> String{
    print("status id \(myAppointments[index].statusId!)")
    return myAppointments[index].statusId!
}
func deletAppointment(index:Int)  {
    myAppointments.remove(at: index)
}

func configure(cell: MyLabAppointmentTableViewCellPrototol, for index: Int) {
    let appointment = myAppointments[index]
    
        cell.configure(appintment:appointment )
        
    
    }
    
}
