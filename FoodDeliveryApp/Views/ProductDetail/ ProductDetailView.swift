//
//   ProductDetailView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - ProductDetailView
// Screen showing detailed information about a selected food item
struct ProductDetailView: View {
    let item: FoodItem                     // Food item to display
    @EnvironmentObject var router: AppRouter   // Router for navigation
    @EnvironmentObject var cartVM: CartViewModel // Cart state manager
    @State private var quantity = 1            // Selected quantity

    var body: some View {
        VStack(spacing: 0) {
            // MARK: Header Image + Back Button
            ZStack(alignment: .topLeading) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()

                Button { router.go(.home) } label: {
                    Image(systemName: "chevron.left")
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding()
            }

            // MARK: Item Details
            VStack(alignment: .leading, spacing: 14) {
                // Title + Rating
                HStack {
                    Text(item.name).font(.h1)
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill").foregroundColor(.brandYellow)
                        Text("\(item.rating, specifier: "%.1f")")
                    }
                }

                // Description
                Text(item.description)
                    .font(.body)
                    .foregroundColor(.brandGray)

                // Add-ons section
                Text("Add Ons").font(.h2)
                HStack(spacing: 12) {
                    ForEach(["drink", "fries", "sauce"], id: \.self) { addon in
                        Image(addon)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .background(Color.brandLight)
                            .clipShape(Circle())
                    }
                }

                // Price + Quantity stepper
                HStack {
                    Text("$\(Int(item.price))")
                        .font(.h1)
                        .foregroundColor(.brandTeal)
                    Spacer()
                    QuantityStepper(quantity: $quantity)
                }

                // Add to cart button
                PrimaryButton(title: "Add To Cart") {
                    for _ in 0..<quantity { cartVM.add(item) } // Add multiple items
                    router.go(.cart)                          // Navigate to cart
                }
            }
            .padding(20)
        }
        .ignoresSafeArea(edges: .top)
    }
}
