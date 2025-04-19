//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 18/04/25.
//

import SwiftUI

struct CarouselItemView: View {
    
    let orderType: OrderType
    
    var body: some View {
        Image(orderType.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    CarouselItemView(orderType: ordersMock[0])
}
