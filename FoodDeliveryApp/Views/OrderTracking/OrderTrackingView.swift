//
//  OrderTrackingView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - OrderTrackingView
// Screen for tracking order progress through different statuses
struct OrderTrackingView: View {
    @EnvironmentObject var router: AppRouter          // Router for navigation
    @State private var status: OrderStatus = .confirmed // Current order status

    var body: some View {
        VStack(spacing: 24) {
            // MARK: Header
            Text("Order Tracking").font(.h2)

            // MARK: Status List
            VStack(alignment: .leading, spacing: 20) {
                ForEach(OrderStatus.allCases, id: \.self) { s in
                    HStack {
                        // Status indicator (checkmark if reached)
                        Image(systemName: statusReached(s) ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(statusReached(s) ? .brandTeal : .brandGray)

                        // Status label
                        Text(s.rawValue).font(.body)
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(14)
            .padding(.horizontal)

            Spacer()

            // MARK: Simulate Delivery Button
            PrimaryButton(title: "Simulate Delivered") {
                withAnimation { status = .delivered } // Update status
                router.go(.confirmed)                 // Navigate to confirmation
            }
            .padding(.horizontal)
        }
        .padding(.top, 40)
        .background(Color.brandLight.ignoresSafeArea())
    }

    // MARK: Status Helper
    // Determines if a given status has been reached based on current status
    private func statusReached(_ s: OrderStatus) -> Bool {
        let order = OrderStatus.allCases
        guard let currentIdx = order.firstIndex(of: status),
              let sIdx = order.firstIndex(of: s) else { return false }
        return sIdx <= currentIdx
    }
}
