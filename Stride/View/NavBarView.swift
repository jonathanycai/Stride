//
//  SwiftUIView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-22.
//

import SwiftUI

struct NavBarView: View {
    // Use a state variable to track the selected tab; 1 corresponds to Home
    @State private var selectedTab = 1

    init() {
        // Customize Tab Bar Appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(AppColour.navBarBackground)
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                // Profle Tab
                Text("Profile View")
                    .navigationTitle("Profile")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(0)

                // Home Tab
                HomePageView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Profile")
                    }
                    .tag(1)
                // Settings Tab
                Text("Settings View")
                    .navigationTitle("Settings")
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
                    .tag(2)
            }
            .accentColor(.black)
        }
        .background(AppColour.navBarBackground.ignoresSafeArea(edges: .bottom))
    }
}

#Preview {
    NavBarView()
}
