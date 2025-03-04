import SwiftUI

struct SettingsView: View {
    @State private var showEmailPopup = false
    @State private var showPasswordPopup = false
    @State private var showDeleteConfirmation = false
    
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
                    .background(AppColour.headerText.opacity(0.2))
                
                VStack(spacing: 18) {
                    // Change Email Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Change Email")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(AppColour.headerText.opacity(0.9))
                            .padding(.horizontal)
                        
                        SettingsButton(title: "Change Email") {
                            withAnimation {
                                showEmailPopup = true
                            }
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
                        
                        SettingsButton(title: "Change Password") {
                            withAnimation {
                                showPasswordPopup = true
                            }
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
                        
                        SettingsButton(title: "Delete Account", isDestructive: true) {
                            showDeleteConfirmation = true
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
            if showEmailPopup {
                EmailChangePopup(isPresented: $showEmailPopup)
                    .transition(.move(edge: .top))
                    .zIndex(1)
            }
            
            // Password Change Popup
            if showPasswordPopup {
                PasswordChangePopup(isPresented: $showPasswordPopup)
                    .transition(.move(edge: .top))
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showEmailPopup)
        .animation(.easeInOut, value: showPasswordPopup)
        .alert("Delete Account", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                // Add delete logic here
            }
        } message: {
            Text("Are you sure you want to delete your account? This action cannot be undone.")
                .foregroundColor(AppColour.headerText)
        }
    }
}

// MARK: - Components
struct SettingsButton: View {
    let title: String
    var isDestructive: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(isDestructive ? .red : AppColour.headerText)
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(AppColour.buttonBackground)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

struct EmailChangePopup: View {
    @Binding var isPresented: Bool
    @State private var currentPassword = ""
    @State private var newEmail = ""
    @State private var confirmEmail = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Cancel") {
                    withAnimation {
                        isPresented = false
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Change Email")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Submit") {
                    // Add submit logic
                    withAnimation {
                        isPresented = false
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
            .background(AppColour.main)
            
            ScrollView {
                Form {
                    Section {
                        CustomTextField(title: "Current Password", text: $currentPassword, isSecure: true)
                        CustomTextField(title: "New Email", text: $newEmail, isSecure: false)
                            .keyboardType(.emailAddress)
                        CustomTextField(title: "Confirm New Email", text: $confirmEmail, isSecure: false)
                            .keyboardType(.emailAddress)
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

struct PasswordChangePopup: View {
    @Binding var isPresented: Bool
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Cancel") {
                    withAnimation {
                        isPresented = false
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Change Password")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Submit") {
                    // Add submit logic
                    withAnimation {
                        isPresented = false
                    }
                }
                .foregroundColor(.white)
            }
            .padding()
            .background(AppColour.main)
            
            ScrollView {
                Form {
                    Section {
                        CustomTextField(title: "Current Password", text: $currentPassword, isSecure: true)
                        CustomTextField(title: "New Password", text: $newPassword, isSecure: true)
                        CustomTextField(title: "Confirm New Password", text: $confirmPassword, isSecure: true)
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

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.white.opacity(0.7))
                .font(.caption)
            
            if isSecure {
                SecureField("", text: $text)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
            } else {
                TextField("", text: $text)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
            }
            
            Divider()
                .background(Color.white.opacity(0.3))
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Modifiers
struct DarkFormModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
            .background(AppColour.main)
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor(AppColour.main)
                UITableView.appearance().separatorColor = .clear
            }
    }
}

#Preview {
    SettingsView()
}
