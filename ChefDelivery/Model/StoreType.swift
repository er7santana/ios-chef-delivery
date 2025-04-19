//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
}
