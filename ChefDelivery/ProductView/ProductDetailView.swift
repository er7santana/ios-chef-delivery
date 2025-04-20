//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var quantity: Int = 1

    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)                
            
            Spacer()
            
            ProductDetailQuantityView(quantity: $quantity)                
            
            Spacer()
            
            ProductDetailButtonView()
        }
            
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    var body: some View {
        Button {
            
        } label: {
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Adicionar ao carrinho")
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .background(Color.colorRed)
                .foregroundStyle(.white)
                .cornerRadius(32)
                .shadow(color: .colorRedDark.opacity(0.5), radius: 10, x: 6, y: 8)
            }
        }
    }
}
