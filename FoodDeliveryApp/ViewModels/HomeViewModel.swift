//
//  HomeViewModel.swift
//  FoodDeliveryApp
//
//  Created by Z.K  on 19/08/2026.
//

import Foundation
import Combine

// MARK: - HomeViewModel
// ObservableObject that manages state for the Home screen
final class HomeViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var searchText: String = ""             // Search input text
    @Published var selectedCategory: String = "All"    // Currently selected category
    @Published var categories = FoodCategory.all       // Available food categories
    @Published var popularItems = FoodItem.sample      // Popular food items list

    // MARK: Computed Property
    // Filters items based on selected category and search text
    var filteredItems: [FoodItem] {
        popularItems.filter {
            (selectedCategory == "All" || $0.category == selectedCategory) &&
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText))
        }
    }
}
