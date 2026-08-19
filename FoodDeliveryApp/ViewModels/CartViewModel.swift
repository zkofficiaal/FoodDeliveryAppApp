//
//  CartViewModel.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import Foundation
import Combine

// MARK: - CartViewModel
// ObservableObject that manages cart state, items, and operations
final class CartViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var items: [CartItem] = [
        CartItem(item: FoodItem.sample[0], quantity: 1),   // Sample pizza item
        CartItem(item: FoodItem.sample[2], quantity: 5)    // Sample chicken item
    ]
    @Published var orderInstruction: String = ""           // Special instructions for order

    // MARK: Computed Properties
    var total: Double { items.reduce(0) { $0 + $1.subtotal } }   // Total cart price
    var itemCount: Int { items.reduce(0) { $0 +
