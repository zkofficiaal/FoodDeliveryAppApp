//
//   FoodCategory.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import Foundation

// MARK: - FoodCategory Model
// Represents a category of food items (e.g., Pizza, Burger)
struct FoodCategory: Identifiable, Equatable {
    // MARK: Properties
    let id = UUID()          // Unique identifier for category
    let title: String        // Display name of category
    let icon: String         // SF Symbol icon name

    // MARK: Sample Categories
    // Static array of all categories used in the app
    static let all: [FoodCategory] = [
        .init(title: "All", icon: "square.grid.2x2"),                // Show all items
        .init(title: "Pizza", icon: "circle.grid.cross"),            // Pizza category
        .init(title: "Burger", icon: "takeoutbag.and.cup.and.straw"),// Burger category
        .init(title: "Dessert", icon: "birthday.cake")               // Dessert category
    ]
}
