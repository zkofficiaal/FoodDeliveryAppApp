import SwiftUI

// MARK: - Poppins Font Extension
// Provides custom font styles using Poppins family.
// Falls back to system rounded if Poppins is not available.
extension Font {
    // MARK: Custom Initializer
    // Returns a Poppins font with given size and weight
    static func poppins(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }

    // MARK: Predefined Styles
    // Common text styles used across the app

    static let h1 = Font.poppins(28, weight: .bold)        // Large heading
    static let h2 = Font.poppins(20, weight: .semibold)    // Section heading
    static let body = Font.poppins(15, weight: .regular)   // Standard body text
    static let caption = Font.poppins(12, weight: .regular)// Small caption text
    static let button = Font.poppins(16, weight: .semibold)// Button labels
}
