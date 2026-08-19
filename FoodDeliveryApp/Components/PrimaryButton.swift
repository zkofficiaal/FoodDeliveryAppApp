//
//  PrimaryButton.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - PrimaryButton
// Reusable button component with filled or outlined style
struct PrimaryButton: View {
    let title: String                 // Button text label
    var isOutlined: Bool = false      // Flag for outlined style
    let action: () -> Void            // Action triggered on tap

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.button)                                // Uses custom button font
                .foregroundColor(isOutlined ? .brandTeal : .white) // Text color depends on style
                .frame(maxWidth: .infinity)                   // Full width button
                .padding(.vertical, 16)                       // Vertical padding
                .background(isOutlined ? Color.white : Color.brandTeal) // Background style
                .overlay(
                    RoundedRectangle(cornerRadius: 14)        // Border shape
                        .stroke(Color.brandTeal, lineWidth: isOutlined ? 1.5 : 0) // Outline if enabled
                )
                .cornerRadius(14)                             // Rounded corners
        }
    }
}
