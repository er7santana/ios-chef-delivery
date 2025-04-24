//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 21/04/25.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case invalidRequest(error: String)
    case invalidResponse(error: String)
}

protocol HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError>
}

struct HomeServiceDefaultImpl: HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-7926e5-eliezerchefdelivery.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await URLSession.custom.data(for: request)
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

struct HomeServiceAlamofireImpl: HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-7926e5-eliezerchefdelivery.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        return await withCheckedContinuation { continuation in
            AF.request(url, method: .get).responseDecodable(of: [StoreType].self) { response in
                switch response.result {
                case .success(let storeObjects):
                    continuation.resume(returning: .success(storeObjects))
                case .failure(let error):
                    continuation.resume(returning: .failure(.invalidRequest(error: error.localizedDescription)))
                }
            }
        }
    }
}
