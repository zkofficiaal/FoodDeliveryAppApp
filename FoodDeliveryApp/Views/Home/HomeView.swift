//
//  HomeView.swift
//  FoodDeliveryApp
//
//  Created by Z.K   on 19/08/2026.
//

import SwiftUI

// MARK: - HomeView
// Main screen showing categories, popular items, and navigation tabs
struct HomeView: View {
    @StateObject private var vm = HomeViewModel()     // ViewModel for home state
    @EnvironmentObject var router: AppRouter          // Router for navigation
    @EnvironmentObject var cartVM: CartViewModel      // Cart state manager
    @State private var selectedTab = 0                // Current tab index

    var body: some View {
        VStack(spacing: 0) {
            // Scrollable content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerBar          // Delivery + cart button
                    searchBar          // Search input
                    specialOfferBanner // Promotional banner

                    // Categories section
                    Text("Categories")
                        .font(.h2)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(vm.categories) { cat in
                                CategoryChip(
                                    category: cat,
                                    isSelected: vm.selectedCategory == cat.title
                                ) {
                                    vm.selectedCategory = cat.title
                                }
                            }
                        }
                    }

                    // Popular items section
                    Text("Popular")
                        .font(.h2)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                        ForEach(vm.filteredItems) { item in
                            FoodItemCard(item: item) {
                                cartVM.add(item)                 // Add to cart
                            } onTap: {
                                router.go(.productDetail(item))  // Navigate to detail
                            }
                        }
                    }
                }
                .padding(16)
            }

            // Bottom tab bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .background(Color.brandLight.ignoresSafeArea())
    }

    // MARK: Header Bar
    private var headerBar: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Deliver to").font(.caption).foregroundColor(.brandGray)
                Text("Downtown, Main St").font(.body.bold())
            }
            Spacer()
            Button { router.go(.cart) } label: {
                Image(systemName: "cart")
                    .font(.system(size: 18))
                    .foregroundColor(.brandDark)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
            }
        }
    }

    // MARK: Search Bar
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.brandGray)
            TextField("Search", text: $vm.searchText)
                .font(.body)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(14)
    }

    // MARK: Special Offer Banner
    private var specialOfferBanner: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Special Offer").font(.caption.bold()).foregroundColor(.white)
                Text("FREE 5 Sandwiches").font(.body.bold()).foregroundColor(.white)
                Text("Today Offer").font(.caption).foregroundColor(.white.opacity(0.8))
            }
            Spacer()
        }
        .padding(16)
        .background(Color.brandTeal)
        .cornerRadius(16)
    }
}
