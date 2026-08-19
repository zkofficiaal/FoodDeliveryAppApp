//
//  AppRouter.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI
import Combine

// MARK: - AppScreen
// Enum representing all possible screens in the app
enum AppScreen: Equatable {
    case onboarding, home
    case productDetail(FoodItem)   // Screen for product details with a FoodItem
    case cart, checkout, payment, tracking, confirmed
}

// MARK: - AppRouter
// ObservableObject that manages navigation between screens
final class AppRouter: ObservableObject {
    // Published property to track the current screen
    @Published var currentScreen: AppScreen = .onboarding

    // MARK: Navigation Method
    // Switches to a new screen with animation
    func go(_ screen: AppScreen) {
        withAnimation { currentScreen = screen }
    }
}
