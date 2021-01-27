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
    case doctorReservation(name: String,email : String,phonenumber : String,bookingDate: String,doctorId : String,checkbox : String)
    case labReservation(name: String,email : String,phonenumber : String,bookingDate: String,labId : String,checkbox : String)
    case showPharmacyDetails(id:String)
    case login(email:String,passsword:String)
    case loginWithSocial(accessTocken:String,provider:String)
    case register(email:String,password:String,name:String,phonenumber:String,genderId:Int,birthday:Date)
    case getUserToken(grantType: String,clientId:String,clientSecret:String,scope:String)
    case updateUser(email:String,name:String,phoneNumber:String,genderId:Int,birthday:Date)
    
    case booking
    case cancelBooking(id:String)
    case resetPassword(email:String,userType:String,token:String,password:String,passwordConfirmation:String)
    
    case searchByAreaAndSpecialty(areaId:String,specialtyId:String)
    case offerSlidShow
    case showOffer(id:String)
    
    case getOffresForSpacificCategory(id:String)
    case showOfferDetails(id:String)
    
    case sendMessage(phonenumber:String,userType:String)
    
    case verifyUser(phonenumber:String,userType:String,code:Int)
    case userOffersReservations
    case offersForSpecificCategory(id:String)
    
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
        case .doctorReservation:
            return NetworkingConstants.doctorReservation
        case .labReservation:
            return NetworkingConstants.labReservation
        case .showDoctorDetails:
            return NetworkingConstants.showDoctorDetails
        case .showDoctorDates:
            return NetworkingConstants.showDoctorDates
        case .showPharmacyDetails:
            return NetworkingConstants.showPharmacyDetails
        case .login:
            return NetworkingConstants.login
        case .loginWithSocial:
            return NetworkingConstants.loginWithSocial
        case .register:
            return NetworkingConstants.register
        case .getUserToken:
            return NetworkingConstants.getUserToken
        case .updateUser:
            return NetworkingConstants.updateUserProfile
        case .booking:
            return NetworkingConstants.getUserBookings
        case .cancelBooking:
            return NetworkingConstants.cancelBooking
        case .resetPassword:
            return NetworkingConstants.resetPassword
        case .searchByAreaAndSpecialty:
            return NetworkingConstants.searchByAreaAndSpecialty
        case .offerSlidShow:
            return NetworkingConstants.offerSlideShow
        case .showOffer:
            return NetworkingConstants.showOffer
        case .getOffresForSpacificCategory:
            return NetworkingConstants.getOffersForSpacificCategory
        case .showOfferDetails:
            return NetworkingConstants.showOfferDetails
        case .sendMessage:
            return NetworkingConstants.sendMessage
        case .verifyUser:
            return NetworkingConstants.verifyUser
        case .userOffersReservations:
            return NetworkingConstants.userOffersReservations
        case .offersForSpecificCategory:
            return NetworkingConstants.offersForSpecificCategory
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
             .showDoctorDates,
             .showPharmacyDetails,
             .booking,
             .cancelBooking,
             .searchByAreaAndSpecialty,
             .offerSlidShow,
             .showOffer,
             .getOffresForSpacificCategory,
             .showOfferDetails,
             .userOffersReservations,
             .offersForSpecificCategory:
            return .get
        case .doctorReservation,
             .labReservation,
             .login,
             .loginWithSocial,
             .register,
             .getUserToken,
             .updateUser,
             .resetPassword,
             .sendMessage,
             .verifyUser:
            return .post
            
        }
    }
    
    var httpHeaders: HTTPHeaders{
        
        var httpHeaders = HTTPHeaders()
        
        switch self {
        case .booking,.updateUser,.userOffersReservations:
            let token = UserDefaults.standard.string(forKey: "token")
            httpHeaders.add(name: "Authorization", value: "Bearer \(token!)")
            httpHeaders.add(name: "Content-Type", value:"application/X-Access-Token")
        case .loginWithSocial:
            let accesstoken = UserDefaults.standard.string(forKey: "accessToken")
            httpHeaders.add(name: "Authorization", value: "Bearer \(accesstoken!)")
            httpHeaders.add(name: "Content-Type", value:"aapplication/x-www-form-urlencoded")
        //            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
        default:
            print("Empty request headers")
        }
        
        return httpHeaders
    }
    
    var body: [String: Any] {
        
        var body = [String:Any]()
        
        switch self {
        case let .register(email, password, name, phonenumber, genderId, birthday):
            body[NetworkingConstants.registerEmailParamter] = email
            body[NetworkingConstants.registerPasswordParamter] = password
            body[NetworkingConstants.registerNameParamter] = name
            body[NetworkingConstants.registerPhoneNumberParamter] = phonenumber
            body[NetworkingConstants.registerGenderIdParamter] = genderId
            body[NetworkingConstants.registerBirthdayParamter] = birthday
        case let .getUserToken(grantType, clientId, clientSecret, scope):
            body[NetworkingConstants.getUserTokenGrantTypeParamter] = grantType
            body[NetworkingConstants.getUserTokenClientIdParamter] = clientId
            body[NetworkingConstants.getUserTokenClientSecretParamter] = clientSecret
            body[NetworkingConstants.getUserTokenScopeParamter] = scope
            
        case let .updateUser(email, name, phoneNumber, genderId, birthday):
            body[NetworkingConstants.updateUserProfileEmailParameter] = email
            body[NetworkingConstants.updateUserProfileNameParameter] = name
            body[NetworkingConstants.updateUserProfilePhoneNumberParameter] = phoneNumber
            body[NetworkingConstants.updateUserProfileGenderIdParameter] = genderId
            body[NetworkingConstants.updateUserProfileBirthdayParameter] = birthday
        case let .loginWithSocial(accessTocken, provider):
            
            body[NetworkingConstants.loginWithSocialProviderParamter] = provider
            body[NetworkingConstants.loginWithSocialAccessTockenParamter] = accessTocken
        case let .login(email, password):
            body[NetworkingConstants.emailParameter] = email
            body[NetworkingConstants.passwordParameter] = password
        case let .resetPassword(email,userType,token,password,passwordConfirmation):
            
            body[NetworkingConstants.emailResetPasswordParamter] = email
            body[NetworkingConstants.userTypeResetPasswordParamter] = userType
            body[NetworkingConstants.tokenResetPasswordParamter] = token
            body[NetworkingConstants.passwordResetPasswordParamter] = password
            body[NetworkingConstants.passwordConfirmationResetPasswordParamter] = passwordConfirmation
        case let .sendMessage(phonenumber, userType):
            body[NetworkingConstants.sendMessagePhoneNumberPrameter] = phonenumber
            body[NetworkingConstants.sendMessageUserTypePrameter] = userType
        case let .verifyUser(phonenumber, userType, code):
            body[NetworkingConstants.verifyUserPhoneNumberPrameter] = phonenumber
            body[NetworkingConstants.verifyUserUserTypePrameter] = userType
            body[NetworkingConstants.verifyUserCodePrameter] = code
        case let .labReservation(name, email, phonenumber, bookingDate, labId, checkbox):
            body[NetworkingConstants.reservationNameParameter] = name
            body[NetworkingConstants.reservationEmailParameter] = email
            body[NetworkingConstants.reservationPhonenumberParameter] = phonenumber
            body[NetworkingConstants.reservationBookingDateParameter] = bookingDate
            body[NetworkingConstants.reservationDoctorIdParameter] = labId
            body[NetworkingConstants.reservationCheckboxParameter] = checkbox
        case let .doctorReservation(name, email, phonenumber, bookingDate, doctorId, checkbox):
            body[NetworkingConstants.reservationNameParameter] = name
            body[NetworkingConstants.reservationEmailParameter] = email
            body[NetworkingConstants.reservationPhonenumberParameter] = phonenumber
            body[NetworkingConstants.reservationBookingDateParameter] = bookingDate
            body[NetworkingConstants.reservationDoctorIdParameter] = doctorId
            body[NetworkingConstants.reservationCheckboxParameter] = checkbox
        case let .loginWithSocial(accessTocken, provider):
            
            body[NetworkingConstants.loginWithSocialProviderParamter] = provider
            body[NetworkingConstants.loginWithSocialAccessTockenParamter] = accessTocken
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
        case let .getOffresForSpacificCategory(id):
            params[NetworkingConstants.getOffersForSpacificCategory] = id
        case let .showDoctorDates(id):
            params[NetworkingConstants.showDoctorDates] = id
        case let .showPharmacyDetails(id):
            params[NetworkingConstants.showPharmacyDetails] = id
        case let .showOfferDetails(id):
            params[NetworkingConstants.showOfferDetails] = id
        case let .offersForSpecificCategory(id):
            params[NetworkingConstants.offersForSpecificCategory] = id
            
        case let .cancelBooking(id):
            params[NetworkingConstants.cancelBooking] = id
        case let .showOffer(id):
            params[NetworkingConstants.cancelBooking] = id
        case let .searchByAreaAndSpecialty(areaid,specialtyId):
            params[NetworkingConstants.searchByAreaAndSpecialtyAreaIdParamter] = areaid
            params[NetworkingConstants.searchByAreaAndSepecialtyIdParamter] = specialtyId
            
            
            //        case let .getUserToken(grantType,clientId,clientSecret,scope):
            //            params[NetworkingConstants.getUserTokenGrantTypeParamter] = grantType
            //            params[NetworkingConstants.getUserTokenClientIdParamter] = clientId
            //            params[NetworkingConstants.getUserTokenClientSecretParamter] = clientSecret
            //            params[NetworkingConstants.getUserTokenScopeParamter] = scope
            
            
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
        urlRequest.headers = httpHeaders
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
             .doctorReservation,
             .labReservation,
             .booking,
             .searchByAreaAndSpecialty,
             .offerSlidShow,
             
             .userOffersReservations:
            
            
            return try URLEncoding.default.encode(urlRequest, with: params)
        case   .login,
               
               .register,
               .getUserToken,
               .updateUser,
               .resetPassword,
               .sendMessage,
               .loginWithSocial,
               .verifyUser:
            
            return try URLEncoding.default.encode(urlRequest, with:body)
            
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
        case .showPharmacyDetails:
            let showPharmacyDetailsUrlString = (urlRequest.url?.absoluteString)!
            
            let showPharmacyDetaisParamString = params[NetworkingConstants.showPharmacyDetails]!
            urlRequest = URLRequest(url: URL(string: showPharmacyDetailsUrlString + (showPharmacyDetaisParamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .cancelBooking:
            let cancelBookingUrlString = (urlRequest.url?.absoluteString)!
            
            let scancelBookingParamString = params[NetworkingConstants.cancelBooking]!
            urlRequest = URLRequest(url: URL(string: cancelBookingUrlString + (scancelBookingParamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .showOffer:
            let showOfferUrlString = (urlRequest.url?.absoluteString)!
            
            let showOfferParamString = params[NetworkingConstants.showOffer]!
            urlRequest = URLRequest(url: URL(string: showOfferUrlString + (showOfferParamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .getOffresForSpacificCategory:
            let getOffresForSpacificCategoryUrlString = (urlRequest.url?.absoluteString)!
            
            let getOffresForSpacificCategoryParamString = params[NetworkingConstants.getOffersForSpacificCategory]!
            urlRequest = URLRequest(url: URL(string: getOffresForSpacificCategoryUrlString + (getOffresForSpacificCategoryParamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .showOfferDetails:
            let showOfferDetailsUrlString = (urlRequest.url?.absoluteString)!
            
            let showOfferDetailsParamString = params[NetworkingConstants.showOfferDetails]!
            urlRequest = URLRequest(url: URL(string: showOfferDetailsUrlString + (showOfferDetailsParamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
        case .offersForSpecificCategory:
            let offersForSpecificCategoryUrlString = (urlRequest.url?.absoluteString)!
            
            let soffersForSpecificCategoryParamString = params[NetworkingConstants.offersForSpecificCategory]!
            urlRequest = URLRequest(url: URL(string: offersForSpecificCategoryUrlString + (soffersForSpecificCategoryParamString as! String))!)
            return try URLEncoding.default.encode(urlRequest, with:nil)
       
        }
    }
}
