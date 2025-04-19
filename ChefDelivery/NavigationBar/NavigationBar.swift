//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            
            Spacer()
            
            Button("Rua Baraldi, 668") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.foreground)
            .padding(.leading, 30)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    NavigationBar()
        .padding()
}

