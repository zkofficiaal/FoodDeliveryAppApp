//
//  HomeViewModel.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//
import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedCategory: String = "All"
    @Published var categories = FoodCategory.all
    @Published var popularItems = FoodItem.sample

    var filteredItems: [FoodItem] {
        popularItems.filter {
            (selectedCategory == "All" || $0.category == selectedCategory) &&
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText))
        }
    }
}
