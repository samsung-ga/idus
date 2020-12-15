//
//  NetworkResult.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/05.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
