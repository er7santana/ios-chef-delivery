//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
                
            VStack {
                Text(store.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.foreground)
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
}
