//
//  Constants.swift
//  Seha Khanah
//
//  Created by Anas on 12/16/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import Foundation



class NetworkingConstants {
    
    static let baseURL = "https://laravelapi.sehakhanah.com/api/"
        
        // Request Headers
        static let contentType = "Content-Type"
        static let accept = "Accept"
        static let contentTypeJSON = "application/json"
  
        static let getOffersCategories = "offer/categories"
        static let getMostOrderedOffers = "offer/mostrequest"
        static let getAllSpecialties = "specialties"
        static let getAllPharmacyOffers = "pharmacy/offers"
        static let getAreas = "areas"
        static let getAllLabs = "laboratories"

        static let search = "search"
        static let searchByNameParameter = "name"
        static let searchBySpecialtyParameter = "specialty"
    
        static let searchForLabByAreaId = "laboratory/search"
        static let searchForLabByAreaIdParameter = "area_id"

        static let aboutUs = "admin/aboutUs"

        static let searchByLabName = "laboratory/search"
        static let searchByLabNameParameter = "name"

        static let showLabDetails = "laboratory/show/"

    
    

   
}
