//
//  PaymentView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - PaymentView
// Screen for selecting payment method and confirming payment
struct PaymentView: View {
    @StateObject private var vm = CheckoutViewModel()   // Checkout state manager
    @EnvironmentObject var cartVM: CartViewModel        // Cart state manager
    @EnvironmentObject var router: AppRouter            // Router for navigation

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // MARK: Header
            HStack {
                Button { router.go(.checkout) } label: {
                    Image(systemName: "chevron.left")   // Back button
                }
                Spacer()
                Text("Payment Method").font(.h2)        // Screen title
                Spacer()
            }

            // MARK: Payment Methods
            ForEach(vm.paymentMethods, id: \.self) { method in
                HStack {
                    Text(method).font(.body)            // Payment method label
                    Spacer()
                    Image(systemName: vm.selectedPaymentMethod == method
                          ? "largecircle.fill.circle"
                          : "circle")                   // Radio button style
                        .foregroundColor(.brandTeal)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .onTapGesture { vm.selectedPaymentMethod = method } // Select method
            }

            Spacer()

            // MARK: Total Section
            HStack {
                Text("Pay").font(.h2)
                Spacer()
                Text("$\(Int(cartVM.total))")
                    .font(.h2)
                    .foregroundColor(.brandTeal)
            }

            // MARK: Pay Button
            PrimaryButton(title: "Pay $\(Int(cartVM.total))") {
                router.go(.tracking) // Navigate to order tracking
            }
        }
        .padding()
        .background(Color.brandLight.ignoresSafeArea())
    }
}
