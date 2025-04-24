//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct ContentView: View {
    
    private var service: HomeService = HomeServiceDefaultImpl() // URLSession
//    private var service: HomeService = HomeServiceAlamofireImpl() //Alamofire
    @State private var stores: [StoreType] = []
    @State private var isLoading: Bool = true
    
    var body: some View {
        
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Carregando...")
                } else {
                    NavigationBar()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: stores)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .padding()
        }
        .task {
            await getStores()
        }
    }
    
    func getStores() async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.stores = stores
            case .failure(let error):
                print("Error: \(error)")
            }
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
