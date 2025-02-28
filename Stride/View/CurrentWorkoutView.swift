import SwiftUI

struct CurrentWorkoutView: View {
    @State private var elapsedTime: TimeInterval = 0
        @State private var totalDuration: TimeInterval
        @State private var isTimerRunning = false
        @State private var isPaused = false
        @State private var showHomePage = false

        // Modified initializer to accept duration
        init(totalDuration: TimeInterval) {
            _totalDuration = State(initialValue: totalDuration)
        }

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
                        .trim(from: 0.0, to: CGFloat(min(elapsedTime / totalDuration, 1.0)))
                        .stroke(Color.green, lineWidth: 6)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 150, height: 150)
                    
                    Text(timeFormatted(elapsedTime))
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding()
                
                // Timer Controls
                HStack(spacing: 20) {
                    if isPaused {
                        // Stop Button
                        Button(action: stopWorkout) {
                            Image(systemName: "square.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Circle().fill(Color.red))
                        }
                        .transition(.asymmetric(
                            insertion: .move(edge: .leading).combined(with: .opacity),
                            removal: .opacity
                        ))
                        
                        // Resume Button
                        Button(action: {
                            withAnimation(.spring(duration: 0.3)) {
                                isPaused = false
                                isTimerRunning = true
                            }
                        }) {
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Circle().fill(Color.blue))
                        }
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .opacity
                        ))
                    } else {
                        // Pause Button
                        Button(action: {
                            withAnimation(.spring(duration: 0.3)) {
                                isPaused = true
                                isTimerRunning = false
                            }
                        }) {
                            Image(systemName: "pause.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Circle().fill(Color.blue))
                        }
                        .transition(.opacity)
                    }
                }
                .animation(.default.speed(1.5), value: isPaused)
                .padding(.horizontal, 20)
                .frame(height: 80)
                
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
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
        .onAppear(perform: startTimer)
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if isTimerRunning {
                elapsedTime += 1
            }
        }
        // Present HomePageView modally with no back option
        .fullScreenCover(isPresented: $showHomePage) {
            NavBarView()
        }
    }
    
    private func startTimer() {
        isTimerRunning = true
    }
    
    private func stopWorkout() {
        isTimerRunning = false
        showHomePage = true
    }
    
    private func timeFormatted(_ totalSeconds: TimeInterval) -> String {
        let minutes = Int(totalSeconds) / 60
        let seconds = Int(totalSeconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CurrentWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWorkoutView(totalDuration: 1200)
    }
}
