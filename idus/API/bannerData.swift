//
//  bannerData.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/05.
//

import Foundation

struct bannerData: Codable {
    let bannerImgURI: String

    enum CodingKeys: String, CodingKey {
        case bannerImgURI = "bannerImgUri"
    }
}


