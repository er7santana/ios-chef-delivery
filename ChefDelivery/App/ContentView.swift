//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView(stores: storesMock)
                            .padding(.horizontal)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            fetchData()
        }
        
    }
    
    func fetchData() {
        guard let url = URL(string: "https://private-7926e5-eliezerchefdelivery.apiary-mock.com/home") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else { return }
            do {
                let stores = try JSONDecoder().decode([StoreType].self, from: data)
                print(stores)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
