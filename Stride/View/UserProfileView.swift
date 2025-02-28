//
//  UserProfileView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-24.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            
            VStack(spacing: 40) {
                // Welcome Text
                VStack(spacing: 10) {
                    Text("COMING SWIFTLY")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.white)
                        .overlay(
                            Text("COMING SWIFTLY")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.5))
                                .offset(x: 4, y: 4)
                        )
                        .overlay(
                            Text("COMING SWIFTLY")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.2))
                                .offset(x: 8, y: 8)
                        )
                        .multilineTextAlignment(.center)
                }
            }
            
        }
    }
}

#Preview {
    UserProfileView()
}
