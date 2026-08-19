//
//  FoodItem.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import Foundation

// MARK: - FoodItem Model
// Represents a single food item in the app
struct FoodItem: Identifiable, Equatable, Hashable {
    // MARK: Properties
    let id: UUID = UUID()                // Unique identifier
    let name: String                     // Food name
    let imageName: String                // Asset name for image
    let price: Double                    // Price of the item
    let rating: Double                   // Customer rating
    let description: String              // Detailed description
    let category: String                 // Category (Pizza, Burger, etc.)

    // MARK: Sample Data
    // Static array of sample items for previews/testing
    static let sample: [FoodItem] = [
        FoodItem(
            name: "Pepperoni Pizza",
            imageName: "pizza",
            price: 25,
            rating: 4.8,
            description: "Classic pepperoni pizza with mozzarella and rich tomato sauce.",
            category: "Pizza"
        ),
        FoodItem(
            name: "Beef Burger",
            imageName: "burger",
            price: 20,
            rating: 4.9,
            description: "A hamburger, or simply burger, is a food consisting of fillings — usually a patty of ground meat, typically beef — placed inside a sliced bun.",
            category: "Burger"
        ),
        FoodItem(
            name: "Grilled Chicken",
            imageName: "chicken",
            price: 18,
            rating: 4.7,
            description: "Tender grilled chicken served with fresh salad and fries.",
            category: "Chicken"
        )
    ]
}
