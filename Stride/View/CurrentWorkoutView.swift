import SwiftUI

//struct CurrentWorkoutView: View {
//    var body: some View {
//        
//        ZStack {
//            AppColour.main.ignoresSafeArea()
//            
//            VStack {
//                Text("Current Workout")
//                .font(
//                Font.custom("Inter", size: 40)
//                .weight(.black)
//                )
//                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
//                .frame(width: 312, height: 28, alignment: .topLeading)
//
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    CurrentWorkoutView()
//}
//
//
struct CurrentWorkoutView: View {
    @State private var elapsedTime: TimeInterval = 606 // Example time (10:06)
    @State private var totalDuration: TimeInterval = 1200 // Example full workout time (20:00)
    
    var body: some View {
        ZStack {
            AppColour.main.ignoresSafeArea()
            
            VStack {
                // Header
                Text("Current Workout")
                    .font(.custom("Inter", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                // Timer Circle
                ZStack {
                    Circle()
                        .trim(from: 0.0, to: CGFloat(elapsedTime / totalDuration))
                        .stroke(Color.green, lineWidth: 6)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 150, height: 150)
                    
                    Text("\(timeFormatted(elapsedTime))")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding()
                
                // Stop Button
                Button(action: {
                    print("Stop Workout")
                }) {
                    Text("STOP")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                
                // Playing Section
                VStack(alignment: .leading) {
                    Text("PLAYING")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    HStack {
                        Image("album_cover")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text("Bound 2 (win)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Kanye West")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text("BPM: 149")
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button(action: { print("Previous") }) {
                                Image(systemName: "backward.fill")
                                    .foregroundColor(.white)
                            }
                            Button(action: { print("Pause") }) {
                                Image(systemName: "pause.fill")
                                    .foregroundColor(.white)
                            }
                            Button(action: { print("Next") }) {
                                Image(systemName: "forward.fill")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Up Next Section
                VStack(alignment: .leading) {
                    Text("UP NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    HStack {
                        Image("next_song_cover")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text("(They) Not Like Us")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Kendrick Lamar")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text("BPM: 140")
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
        
    }
    // Helper function to format time
    func timeFormatted(_ totalSeconds: TimeInterval) -> String {
        let minutes = Int(totalSeconds) / 60
        let seconds = Int(totalSeconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
        
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWorkoutView()
    }
}
