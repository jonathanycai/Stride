//
//  SwiftUIView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-22.
//

import SwiftUI

struct NavBarView: View {
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
            TabView {
                // Profile Tab
                NewWorkoutView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }

                // Home Tab
                Text("Home View")
                    .navigationTitle("Home")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                // Settings Tab
                Text("Settings View")
                    .navigationTitle("Settings")
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
            }
            .accentColor(.black)
        }
        .background(AppColour.navBarBackground.ignoresSafeArea(edges: .bottom))
    }
}


#Preview {
    NavBarView()
}
