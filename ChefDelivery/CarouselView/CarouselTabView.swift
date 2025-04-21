//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var currentIndex = 0
    
    let orders: [OrderType] = [
        OrderType(id: 0, name: "Pizza", image: "barbecue-banner"),
        OrderType(id: 1, name: "Sushi", image: "brazilian-meal-banner"),
        OrderType(id: 2, name: "Burger", image: "pokes-banner"),
    ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(orders) { order in
                CarouselItemView(orderType: order)
                    .tag(order.id)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 180)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % orders.count
                }
            }
        }
    }
}

#Preview {
    CarouselTabView()
}
