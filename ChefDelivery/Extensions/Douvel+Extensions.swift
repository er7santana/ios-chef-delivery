//
//  Douvel+Extensions.swift
//  ChefDelivery
//
//  Created by Eliezer Rodrigo on 19/04/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
