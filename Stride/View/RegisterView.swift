//
//  LoginView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-24.
//

import SwiftUI

struct RegisterView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            // Background color
            AppColour.strideBlue
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Welcome Text
                VStack(spacing: 10) {
                    Text("Welcome to Stride")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .overlay(
                            Text("Welcome to Stride")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.5))
                                .offset(x: 4, y: 4)
                        )
                        .overlay(
                            Text("Welcome to Stride")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.white.opacity(0.2))
                                .offset(x: 8, y: 8)
                        )
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 30)
                
                Spacer(minLength: 9)
                
                // Input Fields
                VStack(spacing: 16) {
                    
                    Text("Register to continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.top, 10)
                    
                    // First Name Field
                    HStack {
                        Image(systemName: "textformat")
                            .foregroundColor(.gray.opacity(0.8))
                        TextField("First Name", text: $firstName)
                            .autocapitalization(.none)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    
                    
                    // Last Name Field
                    HStack {
                        Image(systemName: "textformat")
                            .foregroundColor(.gray.opacity(0.8))
                        TextField("Last Name", text: $lastName)
                            .autocapitalization(.none)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    
                    
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
                                .foregroundColor(Color.orange)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 32)
                
                // Register Button
                Button(action: {
                    // Register action here
                }) {
                    HStack {
                        Text("REGISTER")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 32)
                
                Spacer(minLength: 30)
                
                // Already have an account? Login
                NavigationLink(destination: LoginView()) {
                    Text("Already have an account? Login")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .underline()
                }
                .padding(.top, 20)
            }
            .padding(.vertical, 40)
        }
    }
}

#Preview {
    NavigationView{
        RegisterView()
    }

}
