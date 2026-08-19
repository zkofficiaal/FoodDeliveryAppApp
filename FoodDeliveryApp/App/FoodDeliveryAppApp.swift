//
//  FoodDeliveryAppApp.swift
//  FoodDeliveryApp 
//
//  Created by Z.K   on 18/08/2026.
//

import SwiftUI

// MARK: - FoodDeliveryApp
// Main application entry point for the Food Delivery app
@main
struct FoodDeliveryApp: App {
    // MARK: State Objects
    // Router handles navigation between screens
    @StateObject private var router = AppRouter()
    // CartViewModel manages cart state and items
    @StateObject private var cartVM = CartViewModel()

    var body: some Scene {
        WindowGroup {
            // RootView is the central navigation container
            RootView()
                .environmentObject(router)   // Inject router globally
                .environmentObject(cartVM)   // Inject cart state globally
        }
    }
}

// MARK: - RootView
// Decides which screen to show based on router state
struct RootView: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        Group {
            // MARK: Screen Routing
            // Switch between screens depending on current route
            switch router.currentScreen {
            case .onboarding: OnboardingView()       // First-time user flow
            case .home: HomeView()                   // Main home screen
            case .productDetail(let item): ProductDetailView(item: item) // Product details
            case .cart: CartView()                   // Shopping cart
            case .checkout: CheckoutView()           // Checkout process
            case .payment: PaymentView()             // Payment screen
            case .tracking: OrderTrackingView()      // Track order delivery
            case .confirmed: OrderConfirmedView()    // Order confirmation
            }
        }
        // Smooth animation when switching screens
        .animation(.easeInOut, value: router.currentScreen)
    }
}
