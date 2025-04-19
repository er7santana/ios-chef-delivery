//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
                
            VStack {
                Text(order.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Tapped on \(order.name)")
        }
    }
}

#Preview {
    StoreItemView(order: OrderType(id: 0, name: "Monstro Burger", image: "monstro-burger-logo"))
}
