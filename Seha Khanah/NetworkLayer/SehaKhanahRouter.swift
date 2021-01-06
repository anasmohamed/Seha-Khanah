//
//  LuzazRouter.swift
//  Luzaz
//
//  Created by jets on 12/15/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire

enum SehaKhanahRouter: URLRequestConvertible {
    
    
    case getOffersCategories
    case getMostOrderedOffers
    case searchByName(name:String)
    case searchBySpecialty(specialty:String)
    case getAllSpecialties
    case getAllPharmacyOffers
    case getAreas
    case searchByLabName(name:String)
    case aboutUs
    case searchForLabByAreaId(areaId:String)
    case getAllLabs
    case showLabDetails(id:String)
    case showDoctorDetails(id:String)
    case showDoctorDates(id:String)
    
    case reservation(name: String,email : String,phonenumber : String,booking_date: String,doctor_id : String,checkbox : String)
    var path: String {
        switch self {
        case .getOffersCategories:
            return NetworkingConstants.getOffersCategories
        case .getMostOrderedOffers:
            return NetworkingConstants.getMostOrderedOffers
        case .searchByName:
            return NetworkingConstants.search
        case.searchBySpecialty:
            return NetworkingConstants.search
        case .getAllSpecialties:
            return NetworkingConstants.getAllSpecialties
        case .getAllPharmacyOffers:
            return NetworkingConstants.getAllPharmacyOffers
        case.getAreas:
            return NetworkingConstants.getAreas
        case .searchByLabName:
            return NetworkingConstants.searchByLabName
        case .aboutUs:
            return NetworkingConstants.aboutUs
        case .searchForLabByAreaId:
            return NetworkingConstants.searchForLabByAreaId
        case .getAllLabs:
            return NetworkingConstants.getAllLabs
        case .showLabDetails:
            return NetworkingConstants.showLabDetails
        case .reservation:
            return NetworkingConstants.reservation
        case .showDoctorDetails:
            return NetworkingConstants.showDoctorDetails
        case .showDoctorDates:
            return NetworkingConstants.showDoctorDates
            
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .getOffersCategories,
             .getMostOrderedOffers,
             .searchByName,
             .searchBySpecialty,
             .getAllSpecialties,
             .getAllPharmacyOffers,
             .getAreas,
             .searchByLabName,
             .aboutUs,
             .searchForLabByAreaId,
             .getAllLabs,
             .showLabDetails,
             .showDoctorDetails,
             .showDoctorDates:
            return .get
        case .reservation:
            return .post
            
        }
    }
    
    //    var httpHeaders: HTTPHeaders {
    //
    //        let httpHeaders = [String:String]()
    //
    //        switch self {
    //            //        case .getOffers:
    //            //            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
    //        //            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
    //        default:
    //            print("Empty request headers")
    //        }
    //
    //        return httpHeaders
    //    }
    
    var body: [String: Any] {
        
        let body = [String:Any]()
        
        switch self {
            
            
        default:
            print("Empty request body")
        }
        
        return body
    }
    
    var params: [String: Any] {
        
        var params = [String:Any]()
        
        switch self {
        case let .searchByName(name):
            params[NetworkingConstants.searchByNameParameter] = name
        case let .searchBySpecialty(specialty):
            params[NetworkingConstants.searchBySpecialtyParameter] = specialty
        case let .searchByLabName(name):
            params[NetworkingConstants.searchByLabNameParameter] = name
        case let .searchForLabByAreaId(areaId):
            params[NetworkingConstants.searchForLabByAreaIdParameter] = areaId
        case let .showLabDetails(id):
            params[NetworkingConstants.showLabDetails] = id
        case let .showDoctorDetails(id):
            params[NetworkingConstants.showDoctorDetails] = id
        case let .showDoctorDates(id):
            params[NetworkingConstants.showDoctorDates] = id
        case let .reservation(name, email, phonenumber, booking_date, doctor_id, checkbox):
            params[NetworkingConstants.reservationNameParameter] = name
            params[NetworkingConstants.reservationEmailParameter] = email
            params[NetworkingConstants.reservationPhonenumberParameter] = phonenumber
            params[NetworkingConstants.reservationBookingDateParameter] = booking_date
            params[NetworkingConstants.reservationDoctorIdParameter] = doctor_id
            params[NetworkingConstants.reservationCheckboxParameter] = checkbox
            
        default:
            print("Empty Paramter")
            
        }
        
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        switch self {
        case .getOffersCategories,
             .getMostOrderedOffers,
             .searchByName,
             .searchBySpecialty,
             .getAllSpecialties,
             .getAllPharmacyOffers,
             .getAreas,
             .searchByLabName,
             .aboutUs,
             .searchForLabByAreaId,
             .getAllLabs,
             .reservation:
            
            
            return try URLEncoding.default.encode(urlRequest, with: params)
        case .showLabDetails:
            let showLabDetailsUrlString = (urlRequest.url?.absoluteString)!
            let labDetailsparamString = params[NetworkingConstants.showLabDetails]!
            
            
            urlRequest = URLRequest(url: URL(string: showLabDetailsUrlString + (labDetailsparamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .showDoctorDetails:
            let showDoctorDetailsUrlString = (urlRequest.url?.absoluteString)!
            
            let doctorDetailsparamString = params[NetworkingConstants.showDoctorDetails]!
            urlRequest = URLRequest(url: URL(string: showDoctorDetailsUrlString + (doctorDetailsparamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .showDoctorDates:
            let showDoctorDatesUrlString = (urlRequest.url?.absoluteString)!
            
            let doctorDatesparamString = params[NetworkingConstants.showDoctorDates]!
            urlRequest = URLRequest(url: URL(string: showDoctorDatesUrlString + (doctorDatesparamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        }
    }
}
