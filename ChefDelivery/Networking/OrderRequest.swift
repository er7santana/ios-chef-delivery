//
//  OrderRequest.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 21/04/25.
//

import Foundation

struct OrderRequest: Codable {
    let product: ProductType
    let quantity: Int
}
