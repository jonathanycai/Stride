import SwiftUI

struct SettingsView: View {
    // Use @StateObject if this is the root creation of the ViewModel.
    // If it's injected from a parent, use @ObservedObject instead.
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Header
                Text("Settings")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(AppColour.headerText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                Divider()
                    // Example: make the divider thicker
                    .frame(height: 2)
                    .background(AppColour.headerText.opacity(0.2))
                
                // Main content
                VStack(spacing: 18) {
                    
                    // Change Email Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Change Email")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(AppColour.headerText.opacity(0.9))
                            .padding(.horizontal)
                        
                        SettingsButtonView(title: "Change Email") {
                            viewModel.openEmailPopup()
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(AppColour.headerText.opacity(0.2))
                            .padding(.top)
                    }
                    
                    // Change Password Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Change Password")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(AppColour.headerText.opacity(0.9))
                            .padding(.horizontal)
                        
                        SettingsButtonView(title: "Change Password") {
                            viewModel.openPasswordPopup()
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(AppColour.headerText.opacity(0.2))
                            .padding(.top)
                    }
                    
                    // Delete Account Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Delete Account")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(AppColour.headerText.opacity(0.9))
                            .padding(.horizontal)
                        
                        SettingsButtonView(title: "Delete Account", isDestructive: true) {
                            viewModel.confirmDeleteAccount()
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(AppColour.lightButtonBackground.opacity(0.2))
                            .padding(.top)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
            
            // Email Change Popup
            if viewModel.showEmailPopup {
                EmailChangePopupView(viewModel: viewModel)
                    .transition(.move(edge: .top))
                    .zIndex(1)
            }
            
            // Password Change Popup
            if viewModel.showPasswordPopup {
                PasswordChangePopupView(viewModel: viewModel)
                    .transition(.move(edge: .top))
                    .zIndex(1)
            }
        }
        // Animate changes to show/hide popups
        .animation(.easeInOut, value: viewModel.showEmailPopup)
        .animation(.easeInOut, value: viewModel.showPasswordPopup)
        
        // Delete confirmation alert
        .alert("Delete Account", isPresented: $viewModel.showDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                viewModel.deleteAccount()
            }
        } message: {
            Text("Are you sure you want to delete your account? This action cannot be undone.")
                .foregroundColor(AppColour.headerText)
        }
    }
}

#Preview {
    SettingsView()
}
