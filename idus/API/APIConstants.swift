//
//  APIConstants.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/05.
//

import Foundation

struct APIConstants {
static let baseURL = "http://ec2-15-165-153-48.ap-northeast-2.compute.amazonaws.com:3000"
// 홈 배너 이미지 가져오기
static let bannerURL = baseURL + "/home/banner"
// 홈 상품 리스트 가져오기
static let productURL = baseURL + "/home/product"
//프로필 데이터 가져오기
static let profileURL = baseURL + "/profile"
}
