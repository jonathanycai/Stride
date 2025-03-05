//
//  DarkFormModifier.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-03-05.
//

import SwiftUI

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
