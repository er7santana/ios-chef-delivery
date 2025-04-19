//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let stores: [OrderType]
    let title = "Lojas"
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            ForEach(stores) { store in
                StoreItemView(order: store)
                    .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    ScrollView {
        StoresContainerView(stores: storesMock)
    }
}
