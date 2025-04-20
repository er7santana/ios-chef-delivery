//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 20/04/25.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    
    let product: ProductType
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                
                Text(product.description)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                
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
}

#Preview {
    StoreDetailProductItemView(product: storesMock[0].products[0])
}
