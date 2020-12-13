//
//  profileData.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/05.
//

import Foundation

struct profileData: Codable {
    let profileImg, badgeImg: String
    let level: String
    let point, coupon: Int
}
