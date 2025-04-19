//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct OrderTypeView: View {
    let orderType: OrderType
    var body: some View {
        VStack(spacing: 5) {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: true)
            Text(orderType.name)
                .font(.system(size: 10))
                .foregroundColor(.black)
        }
        .frame(width: 70, height: 100)
    }
}

#Preview {
    OrderTypeView(orderType: ordersMock[0])
}
