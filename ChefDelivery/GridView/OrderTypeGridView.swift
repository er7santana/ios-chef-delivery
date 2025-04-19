//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15) {
            ForEach(ordersMock) { order in
                OrderTypeView(orderType: order)
            }
        }
        .frame(height: 200)
        .padding(.top, 15)
    }
}

#Preview {
    OrderTypeGridView()
}
