//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    let orders: [OrderType] = [
        OrderType(id: 0, name: "Pizza", image: "barbecue-banner"),
        OrderType(id: 1, name: "Sushi", image: "brazilian-meal-banner"),
        OrderType(id: 2, name: "Burger", image: "pokes-banner"),
    ]
    
    var body: some View {
        TabView {
            ForEach(orders) { order in
                CarouselItemView(orderType: order)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 180)
    }
}

#Preview {
    CarouselTabView()
}
