//import Foundation
//
//struct productData: Codable {
//    let imageURL: String
//    let tag, name, seller: String
//    let percent, price, rating, review: Int
//
//    enum CodingKeys: String, CodingKey {
//        case imageURL = "image_url"
//        case tag, name, seller, percent, price, rating, review
//    }
//}
//
import Foundation

// MARK: - ProductData
struct ProductData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [Pdata]
}

// MARK: - Pdata
struct Pdata: Codable {
    let imageURL: String
    let tag, name, seller: String
    let price, rating, review: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case tag, name, seller, price, rating, review
    }
}
