//
//  EscapeModel.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import Foundation


struct EscapeModel: Codable {
    let response: String?
    let token: String?
}
struct SplashImages {
    let splashImageTop, splashImageBottom: String
}
struct LoginModel {
    let response: String
    let user: User
    let foodMenu, attractionsMenu: Int
    let splashImages: SplashImages
}
struct User {
    let id, roleID, locationID: Int
    let address1, address2, city, zip: NSNull
    let bookingToken, accessToken: NSNull
    let name: String
    let firstName, lastName, email: NSNull
    let phoneCode, phone: String
    let image, gender, birthday, cinemaID: NSNull
    let memberID: NSNull
}
