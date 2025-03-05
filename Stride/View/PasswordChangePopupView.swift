//
//  PasswordChangePopupView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-03-05.
//

import SwiftUI

struct PasswordChangePopupView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Cancel") {
                    withAnimation {
                        viewModel.closePopups()
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Change Password")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Submit") {
                    withAnimation {
                        viewModel.submitNewPassword()
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
            .background(AppColour.main)
            
            ScrollView {
                Form {
                    Section {
                        CustomTextField(title: "Current Password",
                                        text: $viewModel.currentPassword,
                                        isSecure: true)
                        
                        CustomTextField(title: "New Password",
                                        text: $viewModel.newPassword,
                                        isSecure: true)
                        
                        CustomTextField(title: "Confirm New Password",
                                        text: $viewModel.confirmPassword,
                                        isSecure: true)
                    }
                    .listRowBackground(AppColour.buttonBackground)
                }
                .modifier(DarkFormModifier())
                .frame(height: UIScreen.main.bounds.height * 0.6)
            }
        }
        .background(AppColour.main)
        .cornerRadius(20)
        .shadow(radius: 20)
        .padding(.horizontal, 10)
        .padding(.top, 60)
    }
}
