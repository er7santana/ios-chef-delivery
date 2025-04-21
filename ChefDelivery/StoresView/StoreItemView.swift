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
                
            VStack(alignment: .leading, spacing: 5) {
                Text(store.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.foreground)
                
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    
                    Text(store.stars.description)
                        .foregroundColor(.yellow)
                    
                    Circle()
                        .frame(width: 6)
                        .padding(.horizontal, 8)
                        
                    
                    Text(store.distance.formatted(.number))
                    Text(" km")
                        
                    
                    Spacer()
                }
                .foregroundStyle(.secondary)
                .font(.subheadline)
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    StoreItemView(store: storesMock[0])
}
