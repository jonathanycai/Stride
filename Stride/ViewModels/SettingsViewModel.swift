//
//  SettingsViewModel.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-03-05.
//

import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var showEmailPopup: Bool = false
    @Published var showPasswordPopup: Bool = false
    @Published var showDeleteConfirmation: Bool = false
    
    @Published var currentPassword: String = ""
    @Published var newEmail: String = ""
    @Published var confirmEmail: String = ""
    
    @Published var newPassword: String = ""
    @Published var confirmPassword: String = ""
    
    
    func openEmailPopup() {
        showEmailPopup = true
    }
    
    func openPasswordPopup() {
        showPasswordPopup = true
    }
    
    func closePopups() {
        showEmailPopup = false
        showPasswordPopup = false
    }
    
    func confirmDeleteAccount() {
        showDeleteConfirmation = true
    }
    
    func deleteAccount() {
        // TODO: Deletion Logic Goes Here
        print("Account deleted!")
    }
    
    func submitNewEmail() {
        // TODO: Email logic goes here
        print("New email submitted: \(newEmail)")
        
        // Reset fields
        currentPassword = ""
        newEmail = ""
        confirmEmail = ""
        
        // Close popup
        closePopups()
    }
    
    /// Submits a new password
    func submitNewPassword() {
        // TODO: Password logic goes here
        print("New password submitted")
        
        // Reset fields
        currentPassword = ""
        newPassword = ""
        confirmPassword = ""
        
        // Close popup
        closePopups()
    }
}
