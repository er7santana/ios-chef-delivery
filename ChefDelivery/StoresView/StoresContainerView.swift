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
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            ForEach(stores) { store in
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

#Preview {
    NavigationView {
        ScrollView {
            StoresContainerView(stores: storesMock)
        }
    }
}
