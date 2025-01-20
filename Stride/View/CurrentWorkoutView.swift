import SwiftUI

struct CurrentWorkoutView: View {
    
    @State private var selectedBPM: Int? = nil
    @State private var customBPM: Double = 100
    @State private var selectedGenre: String? = nil
    @State private var workoutDuration: String = ""
    
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                // HEADER
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(AppColour.headerText)
                                .frame(width: 50, height: 50)
                            Text("JG")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(AppColour.main)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Good Morning!")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Hello, John Grey")
                                .font(.subheadline)
                        }
                    }
                    Divider()
                        .background(AppColour.headerText)
                }
                .padding(.horizontal)
                .foregroundColor(AppColour.headerText)
                
                // BPM SELECTION
                VStack(alignment: .leading, spacing: 8) {
                    Text("How are you feeling today?")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(AppColour.headerText)
                }
                .padding(.horizontal)
                
                // Buttons
                HStack(spacing: 16) {
                    ForEach([80, 120, 145], id: \.self) { bpm in
                        Button(action: { selectedBPM = bpm }) {
                            VStack(spacing: 8) {
                                
                                
                                Text(bpm == 80 ? "Taking it easy" : bpm == 120 ? "The usual" : "Pushing the limits")
                                    .font(.system(size: 16, weight: .bold))
                                
                                
                                Text("\(bpm) BPM")
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 110, height: 100)
                            .background(selectedBPM == bpm ? AppColour.buttonSelected : AppColour.buttonBackground)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CurrentWorkoutView()
}
