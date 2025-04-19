//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
