//
//  CurrentWorkoutView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-14.
//

import SwiftUI

struct CurrentWorkoutView: View {
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            //header
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(AppColour.headerText) // Background color for the circle
                            .frame(width: 50, height: 50) // Size of the circle
                        Text("JG")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(AppColour.main) // Text color
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Good Morning!")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Hello, John Grey")
                            .font(.subheadline)
                    }
                }
                Divider()
                    .background(AppColour.headerText)
            }
            .padding()
            .foregroundColor(AppColour.headerText)
        }
        
        
    }
}

#Preview {
    CurrentWorkoutView()
}
