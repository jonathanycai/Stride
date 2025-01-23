//
//  StrideAnimation.swift
//  Stride
//
//  Created by Jonathan Cai on 2025-01-23.
//

import SwiftUI

struct StrideAnimation: View {
    @State private var animateBloom = false
    
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            // Blooming Circle
            Circle()
                .fill(AppColour.strideBlue)
                .frame(width: animateBloom ? UIScreen.main.bounds.width * 3 : 0,
                       height: animateBloom ? UIScreen.main.bounds.height * 3 : 0)
                .scaleEffect(animateBloom ? 1 : 0)
                .animation(Animation.easeOut(duration: 1.5), value: animateBloom)
                .onAppear {
                    animateBloom = true
                }
            
            // Center Image
            Image("S-3")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .zIndex(1)
        }
    }
}

#Preview {
    StrideAnimation()
}
