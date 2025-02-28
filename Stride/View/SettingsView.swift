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
            .transparentSheet(isPresented: $showEmailPopup) {
                EmailChangePopup(isPresented: $showEmailPopup)
            }
            .transparentSheet(isPresented: $showPasswordPopup) {
                PasswordChangePopup(isPresented: $showPasswordPopup)
            }
        }
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
        NavigationView {
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
            .navigationTitle("Change Email")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .colorScheme(.dark)
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
                Section {
                    CustomTextField(title: "Current Password", text: $currentPassword, isSecure: true)
                    CustomTextField(title: "New Password", text: $newPassword, isSecure: true)
                    CustomTextField(title: "Confirm New Password", text: $confirmPassword, isSecure: true)
                }
                .listRowBackground(AppColour.buttonBackground)
            }
            .modifier(DarkFormModifier())
            .navigationTitle("Change Password")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .colorScheme(.dark)
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

extension View {
    func transparentSheet<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        self.sheet(isPresented: isPresented) {
            content()
                .background(TransparentBackground())
                .presentationDetents([.medium])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct TransparentBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    SettingsView()
}
