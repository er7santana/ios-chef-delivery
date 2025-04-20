//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 20/04/25.
//

import SwiftUI

struct ProductDetailQuantityView: View {

    @Binding var quantity: Int

    var body: some View {
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
    }
}

#Preview {
    @Previewable @State var quantity: Int = 1
    ProductDetailQuantityView(quantity: $quantity)
}
