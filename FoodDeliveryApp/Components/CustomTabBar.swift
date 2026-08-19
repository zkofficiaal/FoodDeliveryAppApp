//
//  CustomTabBar.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - CustomTabBar
// Reusable bottom tab bar with selectable icons
struct CustomTabBar: View {
    @Binding var selectedTab: Int              // Currently selected tab index
    let icons = ["house.fill", "heart", "bag", "person"] // Tab icons (SF Symbols)

    var body: some View {
        HStack {
            ForEach(0..<icons.count, id: \.self) { i in
                Spacer()
                // Tab icon
                Image(systemName: icons[i])
                    .font(.system(size: 20))
                    .foregroundColor(selectedTab == i ? .brandTeal : .brandGray) // Active vs inactive color
                    .onTapGesture { selectedTab = i } // Update selected tab
                Spacer()
            }
        }
        .padding(.vertical, 14)                          // Vertical spacing
        .background(Color.white)                         // Tab bar background
        .clipShape(RoundedRectangle(cornerRadius: 20))   // Rounded bar shape
        .shadow(color: .black.opacity(0.06), radius: 8, y: -2) // Subtle top shadow
        .padding(.horizontal)                            // Horizontal padding
    }
}
