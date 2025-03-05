//
//  SettingsButtonView.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-03-05.
//

import SwiftUI

struct SettingsButtonView: View {
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
