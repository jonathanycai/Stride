//
//  LoginView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            
            // Gradient background
                        LinearGradient(
                            gradient: Gradient(colors: [AppColour.strideBlue, AppColour.strideBlue]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .ignoresSafeArea()
            
            
            VStack(spacing: 40) {
                // Welcome Text
                VStack(spacing: 10) {
                    Text("STRIDE")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.white)
                        .overlay(
                            Text("STRIDE")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.5))
                                .offset(x: 4, y: 4)
                        )
                        .overlay(
                            Text("STRIDE")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.2))
                                .offset(x: 8, y: 8)
                        )
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 250)
                
                
                // Input Fields
                VStack(spacing: 16) {
                    
                    Text("Login to continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.top, 10)
                    
                    // Email Field
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray.opacity(0.8))
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    
                    // Password Field
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray.opacity(0.8))
                        SecureField("Password", text: $password)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            // Forgot password action
                        }) {
                            Text("Forgot")
                                .font(.system(size: 14))
                                .foregroundColor(AppColour.strideBlue)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 32)
                
                // Login Button
                Button(action: {
                    // Login action here (future implementation)
                }) {
                    HStack {
                        Text("LOGIN")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 32)
                
                Spacer(minLength: 30)
                
                // Register NavigationLink
                NavigationLink(destination: RegisterView()) {
                    Text("Don't have an account? Register")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .underline() // Underlined text for better visibility
                }
                .padding(.top, 20)
                
            }
            .padding(.vertical, 40)
        }
    }
}

#Preview {
    NavigationView{
        LoginView()
    }
    
}
