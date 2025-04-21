//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import Foundation

struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let distance: Double
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case distance
        case logoImage = "logo_image"
        case headerImage = "header_image"
        case location
        case stars
        case products
    }
}
