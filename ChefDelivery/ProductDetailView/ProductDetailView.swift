//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    var service: OrderService = OrderService()
    
    @Environment(\.dismiss) var dismiss
    @State private var quantity: Int = 1
    @State private var showAlert = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)                
            
            Spacer()
            
            ProductDetailQuantityView(quantity: $quantity)                
            
            Spacer()
            
            ProductDetailButtonView {
                Task {
                    await confirmOrder()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("OK"), action: {
                dismiss()
            }))
        }
    }
    
    func confirmOrder() async {
        do {
            let request = OrderRequest(product: product, quantity: quantity)
            let result = try await service.confirmOrder(orderRequest: request)
            switch result {
            case .success(let response):
                showAlert = true
                alertMessage = response.message
            case .failure(let error):
                print("Error: \(error)")
            }
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    
    var onButtonPressed: (() -> Void)
    
    var body: some View {
        Button {
            onButtonPressed()
        } label: {
            HStack {
                Image(systemName: "cart")
                Text("Enviar pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color.colorRed)
            .foregroundStyle(.white)
            .cornerRadius(32)
            .shadow(color: .colorRedDark.opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}
