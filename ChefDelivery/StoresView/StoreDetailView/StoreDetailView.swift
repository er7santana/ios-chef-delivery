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
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductsView(products: store.products)
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
