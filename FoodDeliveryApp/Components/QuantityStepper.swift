//
//  QuantityStepper.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - QuantityStepper
// Reusable stepper component for adjusting item quantity
struct QuantityStepper: View {
    @Binding var quantity: Int                  // Bound quantity value
    var onIncrement: () -> Void = {}            // Callback when incremented
    var onDecrement: () -> Void = {}            // Callback when decremented

    var body: some View {
        HStack(spacing: 10) {
            // Decrement button
            stepperButton(symbol: "minus") {
                if quantity > 1 { quantity -= 1 }   // Prevent going below 1
                onDecrement()
            }

            // Current quantity display
            Text("\(quantity)")
                .font(.body.bold())
                .frame(minWidth: 18)

            // Increment button
            stepperButton(symbol: "plus") {
                quantity += 1
                onIncrement()
            }
        }
    }

    // MARK: Stepper Button Factory
    // Creates a circular button with SF Symbol icon
    private func stepperButton(symbol: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: symbol)
                .font(.caption.bold())          // Small bold icon
                .foregroundColor(.white)        // White icon color
                .frame(width: 24, height: 24)   // Fixed size
                .background(Color.brandTeal)    // Brand accent background
                .clipShape(Circle())            // Circular shape
        }
    }
}
