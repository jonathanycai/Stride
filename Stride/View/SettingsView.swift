import SwiftUI

struct SettingsView: View {
    @State private var showEmailPopup = false
    @State private var showPasswordPopup = false
    @State private var showDeleteConfirmation = false
    
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Change Email Button
                SettingsButton(title: "Change Email") {
                    showEmailPopup = true
                }
                
                // Change Password Button
                SettingsButton(title: "Change Password") {
                    showPasswordPopup = true
                }
                
                // Delete Account Button
                SettingsButton(title: "Delete Account", isDestructive: true) {
                    showDeleteConfirmation = true
                }
                
                Spacer()
            }
            .padding(.top, 40)
        }
        .sheet(isPresented: $showEmailPopup) {
            EmailChangePopup(isPresented: $showEmailPopup)
        }
        .sheet(isPresented: $showPasswordPopup) {
            PasswordChangePopup(isPresented: $showPasswordPopup)
        }
        .alert("Delete Account", isPresented: $showDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                // Add delete logic here
            }
        } message: {
            Text("Are you sure you want to delete your account? This action cannot be undone.")
        }
    }
}


struct ColouredForm: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
            .background(AppColour.main)
            .onAppear {
                // Style UITableView components (for Form)
                UITableView.appearance().backgroundColor = UIColor(AppColour.main)
                UITableViewCell.appearance().backgroundColor = UIColor(AppColour.main)
                UITableView.appearance().separatorColor = UIColor(AppColour.headerText)
            }
    }
}


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
        NavigationView {
            Form {
                SecureField("Current Password", text: $currentPassword)
                TextField("New Email", text: $newEmail)
                    .keyboardType(.emailAddress)
                TextField("Confirm New Email", text: $confirmEmail)
                    .keyboardType(.emailAddress)
            }
            .modifier(ColouredForm())
            .navigationTitle("Change Email")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") {
                        // Add validation logic here
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct PasswordChangePopup: View {
    @Binding var isPresented: Bool
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView {
            Form {
                SecureField("Current Password", text: $currentPassword)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmPassword)
            }
            .modifier(ColouredForm())
            .navigationTitle("Change Password")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") {
                        // Add validation logic here
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
