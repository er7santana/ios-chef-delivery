//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let stores: [StoreType]
    let title = "Lojas"
    @State private var ratingFilter: Int = 0
    
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            HStack {
                                let baseText = rating == 1 ? "1 estrela" : "\(rating) estrelas"
                                Text(rating < 5 ? "\(baseText) ou mais" : baseText)
                            }
                        }
                    }
                }
                .foregroundStyle(.foreground)
            }
            
            if filteredStores.isEmpty {
                Text("Nenhuma loja encontrada.")
                    .font(.title2)
                    .foregroundStyle(.colorRed)
                    .padding(.vertical, 32)
                    .frame(maxWidth: .infinity)
            } else {
                ForEach(filteredStores) { store in
                    NavigationLink {
                        StoreDetailView(store: store)
                    } label: {
                        StoreItemView(store: store)
                    }
                    .foregroundStyle(.foreground)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ScrollView {
            StoresContainerView(stores: storesMock)
        }
    }
}
