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
            VStack(alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Quantidade")
                    .font(.title3)
                    .bold()
                
                HStack {
                    Button {
                        if quantity > 1 {
                            quantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .bold()
                    }
                    .disabled(quantity <= 1)
                    
                    Text(quantity.description)
                        .font(.title2)
                        .bold()
                    
                    Button {
                        quantity += 1
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .bold()
                    }
                }
            }
            
            Spacer()
            
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
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
