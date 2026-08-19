//
//  CheckoutView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - CheckoutView
// Screen for entering delivery address, reviewing order, and proceeding to payment
struct CheckoutView: View {
    @StateObject private var vm = CheckoutViewModel()   // Checkout state manager
    @EnvironmentObject var cartVM: CartViewModel        // Cart state manager
    @EnvironmentObject var router: AppRouter            // Router for navigation

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // MARK: Header
            HStack {
                Button { router.go(.cart) } label: {
                    Image(systemName: "chevron.left")   // Back button
                }
                Spacer()
                Text("Checkout").font(.h2)              // Screen title
                Spacer()
            }

            // MARK: Delivery Address
            VStack(alignment: .leading, spacing: 8) {
                Text("Delivery Address").font(.body.bold())
                TextField("Address", text: $vm.address)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
            }

            // MARK: Order Summary
            VStack(alignment: .leading, spacing: 8) {
                Text("Order Summary").font(.body.bold())
                ForEach(cartVM.items) { item in
                    HStack {
                        Text("\(item.quantity)x \(item.item.name)") // Item name + quantity
                        Spacer()
                        Text("$\(Int(item.subtotal))")              // Item subtotal
                    }
                    .font(.caption)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)

            Spacer()

            // MARK: Total Section
            HStack {
                Text("Total").font(.h2)
                Spacer()
                Text("$\(Int(cartVM.total))")
                    .font(.h2)
                    .foregroundColor(.brandTeal)
            }

            // MARK: Proceed Button
            PrimaryButton(title: "Proceed to Payment") {
                router.go(.payment) // Navigate to payment screen
            }
        }
        .padding()
        .background(Color.brandLight.ignoresSafeArea())
    }
}
