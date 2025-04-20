//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import SwiftUI

struct StoreDetailView: View {
    @Environment(\.dismiss) var dismiss
    let store: StoreType
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                
                ForEach(store.products) { product in
                    HStack(spacing: 8) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.name)
                                .bold()
                            
                            Text(product.description)
                                .foregroundStyle(.secondary)
                            
                            Text(product.formattedPrice)
                                
                        }
                        
                        Spacer()
                        
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .frame(width: 120, height: 120)
                            .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        // Action for back button
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .foregroundStyle(.foreground)
//                            .font(.title2)
//                    }
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundStyle(Color.colorRed)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for cart button
                    }) {
                        Image(systemName: "cart")
                            .foregroundStyle(.foreground)
                            .font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        StoreDetailView(store: storesMock[0])
    }
}
