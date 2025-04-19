//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    var body: some View {
        VStack(alignment: .leading) {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Image(store.logoImage)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack {
                Text(store.location)
                
                Spacer()
                
                ForEach(1...store.stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        StoreDetailView(store: storesMock[0])
    }
}
