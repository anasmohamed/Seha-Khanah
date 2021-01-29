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
    
    static let search = "api/search"
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
    static let labReservation = "api/laboratory/reservation"
    
    static let reservationNameParameter = "name"
    static let reservationEmailParameter = "email"
    static let reservationPhonenumberParameter = "phonenumber"
    static let reservationBookingDateParameter = "booking_date"
    static let reservationDoctorIdParameter = "doctor_id"
    static let reservationLaboratoryIdParameter = "laboratory_id"
    static let reservationCheckboxParameter = "checkbox"
    
    static let register = "api/register"
    static let registerEmailParamter = "email"
    static let registerPasswordParamter = "password"
    static let registerNameParamter = "name"
    static let registerPhoneNumberParamter = "phonenumber"
    static let registerGenderIdParamter = "gender_id"
    static let registerBirthdayParamter = "birthday"
    
    static let loginWithSocial = "api/social-mobile"
    
    static let loginWithSocialAccessTockenParamter = "email"
    static let loginWithSocialProviderParamter = "provider"
    
    static let updateUserProfile = "api/user/update"
    static let updateUserProfileEmailParameter = "email"
    static let updateUserProfileNameParameter = "name"
    static let updateUserProfilePhoneNumberParameter = "phonenumber"
    static let updateUserProfileGenderIdParameter = "gender_id"
    static let updateUserProfileBirthdayParameter = "birthday"
    
    static let getUserToken = "oauth/token"
    static let getUserTokenGrantTypeParamter = "grant_type"
    static let getUserTokenClientIdParamter = "client_id"
    static let getUserTokenClientSecretParamter = "client_secret"
    static let getUserTokenScopeParamter = "scope"
    
    static let getUserBookings = "api/user/booking"
    static let cancelBooking = "api/user/booking/cancle"
    
    static let resetPassword = "api/password/reset"
    static let emailResetPasswordParamter = "email"
    static let userTypeResetPasswordParamter = "user_type"
    static let tokenResetPasswordParamter = "token"
    static let passwordResetPasswordParamter = "password"
    static let passwordConfirmationResetPasswordParamter = "password_confirmation"
    
    
    static let searchByAreaAndSpecialty = "api/search"
    static let searchByAreaAndSpecialtyNameParamter = "name"
    static let searchByAreaAndSpecialtyAreaIdParamter = "area_id"
    static let searchByAreaAndSepecialtyIdParamter = "specialty_id"
    
    static let offerSlideShow = "api/offer/slideshow"
    static let showOffer = "api/offers/"
    static let showOfferDetails = "api/offers/"
    
    static let getOffersForSpacificCategory = "api/offer-subcategory/"
    
    
    static let sendMessage = "api/send-message"
    static let sendMessagePhoneNumberPrameter = "phonenumber"
    static let sendMessageUserTypePrameter = "user_type"
    
    static let verifyUser = "api/verify-user"
    static let verifyUserPhoneNumberPrameter = "phonenumber"
    static let verifyUserUserTypePrameter = "user_type"
    static let verifyUserCodePrameter = "code"

    static let userOffersReservations = "api/user/offer/booking"
    
    static let offersForSpecificCategory = "api/offer-category/"


}
