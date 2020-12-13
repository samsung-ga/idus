//
//  BannerService.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/07.
//

import Foundation
import Alamofire

struct BannerService{
    static let shared = BannerService()
    static var bannerUri = ""
    func Banner(craft: CraftViewController){
        let url = APIConstants.bannerURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                judgeBanner(status: statusCode, data: data)
                craft.setBanner()
            case .failure(let err):
                print("통신실패")
                print(err)
            }
        }
    }
    private func judgeBanner(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<bannerData>.self, from: data) else {
            return .pathErr}
        switch status {
        case 200:
            print(decodedData.data?.bannerImgURI)
            BannerService.bannerUri = decodedData.data!.bannerImgURI
            return .success(decodedData.data?.bannerImgURI)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
        }
    }

