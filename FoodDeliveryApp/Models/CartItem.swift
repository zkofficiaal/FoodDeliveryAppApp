//
//  CartItem.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import Foundation

// MARK: - CartItem Model
// Represents a food item added to the shopping cart
struct CartItem: Identifiable, Equatable {
    // MARK: Properties
    let id = UUID()                  // Unique identifier for cart entry
    let item: FoodItem               // The food item being purchased
    var quantity: Int                // Number of units selected

    // MARK: Computed Property
    // Calculates subtotal price for this cart item
    var subtotal: Double { item.price * Double(quantity) }
}
