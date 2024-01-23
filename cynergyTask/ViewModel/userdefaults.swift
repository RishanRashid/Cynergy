//
//  userdefaults.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import Foundation


enum DefaultKeys: String {
    case AccessToken = "accesstoken"
    case member_id = "member_id"
    case user_id = "user_id"
    
}


class UserDefault {
    
    static let shared = UserDefault()
    
    func setAccessToken(accessToken: String?) {
        UserDefaults.standard.set(accessToken, forKey: DefaultKeys.AccessToken.rawValue)
    }
    
    func getAccessToken() -> String {
        UserDefaults.standard.string(forKey: DefaultKeys.AccessToken.rawValue) ?? ""
    }
    
    func setMemberId(memberId: String?) {
        UserDefaults.standard.set(memberId, forKey: DefaultKeys.member_id.rawValue)
    }
    
    func getMemberId() -> String {
        UserDefaults.standard.string(forKey: DefaultKeys.member_id.rawValue) ?? ""
    }
    func setUserId(userId: String?) {
        UserDefaults.standard.set(userId, forKey: DefaultKeys.user_id.rawValue)
    }
    
    func getUserId() -> String {
        UserDefaults.standard.string(forKey: DefaultKeys.user_id.rawValue) ?? ""
    }
}
