//
//  CartView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - CartView
// Screen showing cart items, totals, and checkout actions
struct CartView: View {
    @EnvironmentObject var cartVM: CartViewModel   // Cart state manager
    @EnvironmentObject var router: AppRouter       // Router for navigation

    var body: some View {
        VStack(spacing: 16) {
            // MARK: Header
            HStack {
                Button { router.go(.home) } label: {
                    Image(systemName: "chevron.left") // Back button
                }
                Spacer()
                Text("\(cartVM.itemCount) items in cart")
                    .font(.h2) // Cart item count
                Spacer()
            }
            .padding(.horizontal)

            // MARK: Cart Items List
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(cartVM.items) { cartItem in
                        HStack {
                            // Item image
                            Image(cartItem.item.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)

                            // Item details
                            VStack(alignment: .leading) {
                                Text(cartItem.item.name).font(.body.bold())
                                Text("$\(Int(cartItem.item.price))")
                                    .foregroundColor(.brandTeal)
                            }

                            Spacer()

                            // Quantity stepper
                            QuantityStepper(
                                quantity: .constant(cartItem.quantity),
                                onIncrement: { cartVM.increment(cartItem) },
                                onDecrement: { cartVM.decrement(cartItem) }
                            )
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)
                    }

                    // Order instruction field
                    TextField("Order Instruction", text: $cartVM.orderInstruction)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal)
            }

            // MARK: Total Section
            HStack {
                Text("Total:").font(.body)
                Spacer()
                Text("$\(Int(cartVM.total))")
                    .font(.h2)
                    .foregroundColor(.brandTeal)
            }
            .padding(.horizontal)

            // MARK: Checkout Button
            PrimaryButton(title: "Checkout") {
                router.go(.checkout) // Navigate to checkout
            }
            .padding(.horizontal)

            // Back to menu option
            Button("Back to Menu") { router.go(.home) }
                .foregroundColor(.brandGray)
                .padding(.bottom)
        }
        .background(Color.brandLight.ignoresSafeArea())
    }
}
