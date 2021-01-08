//
//  Constants.swift
//  Seha Khanah
//
//  Created by Anas on 12/16/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation



class NetworkingConstants {
    static let baseURL = "https://laravelapi.sehakhanah.com/"
    // Request Headers
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let contentTypeJSON = "application/json"
    
    static let getOffersCategories = "api/offer/categories"
    static let getMostOrderedOffers = "api/offer/mostrequest"
    static let getAllSpecialties = "api/specialties"
    static let getAllPharmacyOffers = "api/pharmacy/offers"
    static let getAreas = "api/areas"
    static let getAllLabs = "api/laboratories"
    
    static let search = "sapi/earch"
    static let searchByNameParameter = "name"
    static let searchBySpecialtyParameter = "specialty"
    
    static let searchForLabByAreaId = "api/laboratory/search"
    static let searchForLabByAreaIdParameter = "area_id"
    
    static let aboutUs = "api/admin/aboutUs"
    
    static let searchByLabName = "api/laboratory/search"
    static let searchByLabNameParameter = "name"
    
    static let showLabDetails = "api/laboratory/show/"
    static let showDoctorDetails = "api/doctor/show/"
    static let showDoctorDates = "api/dates/"
    static let showPharmacyDetails = "api/pharmacy/offer/show/"
    
    
    static let login = "api/login"
    static let emailParameter = "email"
    static let passwordParameter = "password"



    static let doctorReservation = "api/reservation"
    static let labReservation = "laboratory/reservation"
    
    static let reservationNameParameter = "name"
    static let reservationEmailParameter = "email"
    static let reservationPhonenumberParameter = "phonenumber"
    static let reservationBookingDateParameter = "booking_date"
    static let reservationDoctorIdParameter = "doctor_id"
    static let reservationLaboratoryIdParameter = "laboratory_id"
    static let reservationCheckboxParameter = "checkbox"
    
    
    
    
    
}
