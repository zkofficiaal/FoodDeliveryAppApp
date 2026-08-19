//
//  Order.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case confirmed = "Order Confirmed"
    case preparing = "Preparing"
    case onTheWay = "On The Way"
    case delivered = "Delivered"
}

struct Order: Identifiable {
    let id = UUID()
    var items: [CartItem]
    var status: OrderStatus = .confirmed
    var total: Double
}
