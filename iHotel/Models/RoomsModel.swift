//
//  RoomsModel.swift
//  iHotel
//
//  Created by Egor Rybin on 20.12.2023.
//

import Foundation

struct Room: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}


struct Rooms: Decodable {
    let rooms: [Room]
}
