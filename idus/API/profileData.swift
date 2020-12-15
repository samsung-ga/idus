//
//  profileData.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/05.
//

import Foundation

// MARK: - ProfileData
struct ProfileData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Profile
}

// MARK: - DataClass
struct Profile: Codable {
    let profileImageURL, badgeImageURL: String
    let level: String
    let point, coupon: Int

    enum CodingKeys: String, CodingKey {
        case profileImageURL = "profileImageUrl"
        case badgeImageURL = "badgeImageUrl"
        case level, point, coupon
    }
}
