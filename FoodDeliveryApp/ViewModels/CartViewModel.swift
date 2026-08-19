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
    var itemCount: Int { items.reduce(0) { $0 + $1.quantity } }  // Total item count

    // MARK: Cart Operations
    // Adds a food item to the cart or increments if already present
    func add(_ food: FoodItem) {
        if let idx = items.firstIndex(where: { $0.item.id == food.id }) {
            items[idx].quantity += 1
        } else {
            items.append(CartItem(item: food, quantity: 1))
        }
    }

    // Increments quantity of a given cart item
    func increment(_ item: CartItem) {
        guard let idx = items.firstIndex(of: item) else { return }
        items[idx].quantity += 1
    }

    // Decrements quantity of a given cart item or removes if zero
    func decrement(_ item: CartItem) {
        guard let idx = items.firstIndex(of: item) else { return }
        if items[idx].quantity > 1 { items[idx].quantity -= 1 }
        else { items.remove(at: idx) }
    }
}
