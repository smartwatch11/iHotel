//
//  HotelModel.swift
//  iHotel
//
//  Created by Egor Rybin on 20.12.2023.
//

import Foundation

struct HotelModel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimal_price: Int
    let price_for_it: String
    let rating: Int
    let rating_name: String
    let image_urls: [String]
    let about_the_hotel: AboutTheHotel
}


struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}
