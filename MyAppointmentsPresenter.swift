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
    
    private weak var view: MyAppointmentsProtocol?
    
    init(view: MyAppointmentsProtocol) {
        self.view = view
        self.myAppointmentsInteractor = MyAppointmentsInteractor()
       
    }
    
    func getMyAppintments() {
        
        view?.showIndicator()
        myAppointmentsInteractor.getMyAppointments(){ (result,error)  in
            if let error = error {
                print("errrror\(error)")
                self.view?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    print("get my bookings result \(result)")
                    self.view?.getMyAppointmentsSuccess()                }
                
            }
            
        }
    }
}
