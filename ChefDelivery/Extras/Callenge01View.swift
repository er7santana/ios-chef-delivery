//
//  Callenge01View.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct Callenge01View: View {
    var body: some View {

        VStack {
                        // Primeiro quadrado
            TabView {
                Color.blue
                    .edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image(systemName: "1.circle")
                    }

                Color.red
                    .edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image(systemName: "2.circle")
                    }

                Color.yellow
                    .edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image(systemName: "3.circle")
                    }
            }
                        // Código a ser alterado
            .tabViewStyle(.page(indexDisplayMode: .always))
            
                        // Segundo quadrado
            TabView {
                Color.purple
                    .edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image(systemName: "circle")
                    }

                Color.orange
                    .edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image(systemName: "circle")
                    }

                Color.green
                    .edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image(systemName: "circle")
                    }
            }
                        // Código a ser alterado
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding()

    }
}

#Preview {
    Callenge01View()
}

import SwiftUI
