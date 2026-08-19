//
//  CheckoutViewModel.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import Foundation
import Combine

// MARK: - CheckoutViewModel
// ObservableObject that manages checkout state and order placement
final class CheckoutViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var address: String = "123 Main Street, Downtown"   // Default delivery address
    @Published var selectedPaymentMethod: String = "Credit Card"   // Currently chosen payment method
    let paymentMethods = ["Credit Card", "PayPal", "Cash on Delivery"] // Available payment options

    // MARK: Checkout Operation
    // Places an order using items and total from CartViewModel
    func placeOrder(cart: CartViewModel) -> Order {
        Order(items: cart.items, total: cart.total)
    }
}
