//
//  SwiftUIView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-22.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {
            // Profile Tab
            NavigationView {
                NewWorkoutView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            
            // Home Tab
            NavigationView {
                Text("Home View")
                    .navigationTitle("Home")
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            // Settings Tab
            NavigationView {
                Text("Settings View")
                    .navigationTitle("Settings")
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .accentColor(.blue) // Customize tab bar item color
    }
}

#Preview {
    NavBarView()
}
