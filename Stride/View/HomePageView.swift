//
//  HomePageView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-14.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            AppColour.main
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 24) {
                    // HEADER
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(AppColour.headerText)
                                    .frame(width: 50, height: 50)
                                Text("JG")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColour.main)
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
                    .padding(.horizontal)
                    .foregroundColor(AppColour.headerText)
                 
                    Spacer()
                    
                    NavigationLink(destination: NewWorkoutView()) {
                        Text("GET STARTED")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColour.lightButtonBackground)
                            .cornerRadius(15)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        HomePageView()
    }
}
