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
    static var productArr : Array<Any>?
    func getProductData(craft: CraftViewController){
        let url = URL(string: APIConstants.productURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            judgeProductData(status: response.statusCode, data: data)
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                ProductService.productArr = jsonObject["data"] as! Array<Any>
                print("여기야")
                print(ProductService.productArr)
                //Pdata로 받아오면 일반 array가 아니어서 활용하는데 문제가 있어서 일반 array를 쓰고자 함.
                //근데 encoding이 되지 않은 상태라서 쓰기엔 좀 어려울 것 같다.
                //이 array가져가서 encoding만 할 수 있으면 좋을텐데
                
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                print(type(of: prettyPrintedJson)) //String형태네...^^;;
                print("prettyPrintedJson\n",prettyPrintedJson)
                //split해서 array에 넣어볼까..?
                craft.setProduct()
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
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
