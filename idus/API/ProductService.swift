//
//  ProductService.swift
//  idus
//
//  Created by JUEUN KIM on 2020/12/07.
//

import Foundation
import Alamofire

let dummy  = ["a","b","c"]
struct ProductService{
    static let shared = ProductService()
    static var productDataData = [String: Any]()
    func Product(){
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
                parsingProduct(status: statusCode, data: data) // 데이터를 다 못받아와서그러나
            case .failure(let err):
                print("통신실패")
                print(err)
            }
            
        }
    }
    private func parsingProduct(status: Int, data: Data) -> Array<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ProductData.self, from: data) else {
            return dummy}
        switch status {
        case 200:
            let countArray = decodedData.data.count
            print(countArray)//Pdata를 array로 인식하고 있는데.. 흠
            for i in 0..<(decodedData.data.count-1){
               //ProductService.productDataData = decodedData.data
            }
            //return ProductService.productDataData //배열 안에 있는거 어케 가져오지
            return dummy
        case 500:
            return dummy
        default:
            return dummy
        }
        }
    }

