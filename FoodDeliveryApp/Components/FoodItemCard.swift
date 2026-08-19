//
//  FoodItemCard.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - FoodItemCard
// Reusable card component for displaying a food item
struct FoodItemCard: View {
    let item: FoodItem              // Food item to display
    var onAdd: () -> Void           // Callback when add button is tapped
    var onTap: () -> Void           // Callback when image is tapped

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Food image with tap gesture
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 90)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .onTapGesture(perform: onTap)

            // Food name
            Text(item.name)
                .font(.caption.bold())
                .foregroundColor(.brandDark)
                .lineLimit(1)

            // Price and add button
            HStack {
                Text("$\(Int(item.price))")
                    .font(.body.bold())
                    .foregroundColor(.brandDark)
                Spacer()
                Button(action: onAdd) {
                    Image(systemName: "plus")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Color.brandTeal)
                        .clipShape(Circle())
                }
            }
        }
        .padding(10)
        .background(Color.white)                         // Card background
        .cornerRadius(16)                                // Rounded corners
        .shadow(color: .black.opacity(0.05), radius: 6, y: 3) // Subtle shadow
    }
}
