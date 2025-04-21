//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import Foundation

struct ProductType: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        price.formatPrice()
    }
}
