//
//  CategoryChip.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - CategoryChip
// Reusable chip component for selecting food categories
struct CategoryChip: View {
    let category: FoodCategory    // Category model (title + icon)
    let isSelected: Bool          // Flag to indicate active selection
    let action: () -> Void        // Callback when tapped

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                // Category icon
                Image(systemName: category.icon)
                    .font(.system(size: 18))

                // Category title
                Text(category.title)
                    .font(.caption)
            }
            // Text color changes based on selection state
            .foregroundColor(isSelected ? .white : .brandDark)
            // Padding for chip shape
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            // Background color changes based on selection state
            .background(isSelected ? Color.brandTeal : Color.brandLight)
            .cornerRadius(14) // Rounded chip corners
        }
    }
}
