//
//  ProfileService.swift
//  idus
//
//  Created by 최영재 on 2020/12/16.
//

import Foundation
import Alamofire

struct ProfileService{
    static let shared = ProfileService()
    
    func getProfile(craft: MyPageViewController) {
        let url = APIConstants.profileURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData{ (response) in switch response.result {
        case .success:
            guard let statusCode = response.response?.statusCode else {
                return
            }
            guard let data = response.value else {
                return
            }
            
            judgeProfileData(status: statusCode, data: data)
//            completion(judgeProfileData(status: statusCode, data: data))
            
        case .failure(let err):
            print(err)
//            completion(.networkFail)
        }
        }
    }
    private func judgeProfileData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ProfileData.self, from: data) else {
            return .pathErr
        }
        switch status {
        case 200:
            print("-----------\n",decodedData)
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}





