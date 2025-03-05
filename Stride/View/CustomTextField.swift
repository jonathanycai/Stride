//
//  CustomTextField.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-03-05.
//

import SwiftUI

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


