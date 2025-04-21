//
//  OrderService.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 21/04/25.
//

import Foundation

struct OrderService {
    func confirmOrder(orderRequest: OrderRequest) async throws -> Result<OrderResponse, RequestError> {
        guard let url = URL(string: "https://private-7926e5-eliezerchefdelivery.apiary-mock.com/order") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let orderData = try JSONEncoder().encode(orderRequest)
        request.httpBody = orderData
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server error")
                return .failure(.invalidResponse(error: "Server error"))
            }
            let orderResponse = try JSONDecoder().decode(OrderResponse.self, from: data)
            return .success(orderResponse)
        } catch {
            print("Error confirming order: \(error)")
            return .failure(.invalidRequest(error: "Error confirming order"))
        }
    }
}
