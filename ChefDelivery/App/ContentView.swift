//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView(stores: storesMock)
                            .padding(.horizontal)
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
