//
//  OrderConfirmedView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - OrderConfirmedView
// Screen shown after successful order placement
struct OrderConfirmedView: View {
    @EnvironmentObject var router: AppRouter   // Router for navigation

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Confirmation icon
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.brandTeal)

            // Confirmation message
            Text("Order Confirmed!").font(.h1)
            Text("Thank you! Your food has been successfully ordered.")
                .font(.body)
                .foregroundColor(.brandGray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()

            // Back to home button
            PrimaryButton(title: "Back to Home") {
                router.go(.home) // Navigate to home screen
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 40)
        }
        .background(Color.brandLight.ignoresSafeArea())
    }
}
