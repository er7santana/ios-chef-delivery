//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 21/04/25.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case invalidRequest(error: String)
    case invalidResponse(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-7926e5-eliezerchefdelivery.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server error")
                return .failure(.invalidResponse(error: "Server error"))
            }
            let storeObjects = try JSONDecoder().decode([StoreType].self, from: data)
            return .success(storeObjects)
        } catch {
            print("Error fetching data: \(error)")
            return .failure(.invalidRequest(error: "Error fetching data"))
        }
    }
}
