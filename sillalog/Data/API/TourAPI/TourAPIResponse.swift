//
//  TourAPIResponse.swift
//  sillalog
//
//  Created by 김은서 on 6/11/26.
//
import Foundation

struct TourAPIResponse: Decodable {
    let response: Response
}

struct Response: Decodable {
    let body: Body
}

struct Body: Decodable {
    let items: Items
}

struct Items: Decodable {
    let item: [TouristSpot]
}

struct TouristSpot: Decodable {
    let contentId: String
    let title: String
    let address: String?
    let imageURL: String?
    let latitude: String?
    let longitude: String?

    enum CodingKeys: String, CodingKey {
        case contentId = "contentid"
        case title
        case address = "addr1"
        case imageURL = "firstimage"
        case latitude = "mapy"
        case longitude = "mapx"
    }
}
