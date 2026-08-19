//
//  AppColors.swift
//  FoodDeliveryApp
//
//  Created by Z.K  on 19/08/2026.
//

import SwiftUI

// MARK: - Brand Colors
// Defines the app’s design system color palette
extension Color {
    static let brandTeal   = Color(hex: "00B894")   // Primary accent
    static let brandLight  = Color(hex: "F8F9FA")   // Light background
    static let brandWhite  = Color(hex: "FFFFFF")   // Pure white
    static let brandDark   = Color(hex: "2D3436")   // Dark text/background
    static let brandYellow = Color(hex: "FDCB6E")   // Highlight/warning
    static let brandGray   = Color(hex: "8395A7")   // Secondary/muted text
}

// MARK: - Hex Color Initializer
// Allows creating Color from hex string (e.g., "FF0000")
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)   // Reads hex string
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)           // Converts hex to integer

        // Extract RGB components
        let r = Double((rgb >> 16) & 0xFF) / 255   // Red channel
        let g = Double((rgb >> 8) & 0xFF) / 255    // Green channel
        let b = Double(rgb & 0xFF) / 255           // Blue channel

        // Initialize SwiftUI Color with RGB values
        self.init(red: r, green: g, blue: b)
    }
}
