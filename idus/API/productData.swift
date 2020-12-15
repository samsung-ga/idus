import Foundation

struct productData: Codable {
    let imageURL: String
    let tag, name, seller: String
    let percent, price, rating, review: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case tag, name, seller, percent, price, rating, review
    }
}

