//
//  OnboardingView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - OnboardingView
// First screen shown to users with branding and entry point
struct OnboardingView: View {
    @EnvironmentObject var router: AppRouter   // Router for navigation

    var body: some View {
        ZStack {
            // Background color covering safe area
            Color.brandTeal.ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                // Onboarding illustration
                Image("onboarding_food")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.horizontal, 32)

                // Onboarding headline
                Text("Taste Your Food")
                    .font(.h1)
                    .foregroundColor(.white)

                Spacer()

                // Primary action button
                PrimaryButton(title: "Get Started") {
                    router.go(.home)   // Navigate to Home screen
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
            }
        }
    }
}
