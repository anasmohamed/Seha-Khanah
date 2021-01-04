//
//  BookingInteractor.swift
//  Seha Khanah
//
//  Created by Anas on 1/4/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class BookingInteractor {
    func labBooking(name : String,email:String,phoneNumber:String,bookingDate : String,labId:String,checkbox:String,
                    completionHandler: @escaping (ReservationResponse?, Error?) -> Void) {
        AF.request(SehaKhanahRouter.reservation(name: name, email: email, phonenumber: phoneNumber, booking_date: bookingDate, doctor_id: labId, checkbox: checkbox)).validate().responseJSON{
            (response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                let bookingResponse = json["data"]["booking"]
                let bookResult = ReservationResponse(withJSON: bookingResponse)
                
                completionHandler(bookResult, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }}
}
