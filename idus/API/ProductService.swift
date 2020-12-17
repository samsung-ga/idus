//
//  ProductService.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/07.
//

import Foundation
import Alamofire

struct ProductService{
    static let shared = ProductService()
    static var productDataModel: [Pdata]?
    func getProductData(craft: CraftViewController){
        let url = APIConstants.productURL
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
                judgeProductData(status: statusCode, data: data) // 데이터를 다 못받아와서그러나
                craft.setProduct()
            case .failure(let err):
                print("통신실패")
                print(err)
            }
            
        }
    }
    private func judgeProductData(status: Int, data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(ProductData.self, from: data) else {
                return .pathErr
            }
            switch status {
            case 200:
                print("ㅅ어공")
                ProductService.productDataModel = decodedData.data
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
