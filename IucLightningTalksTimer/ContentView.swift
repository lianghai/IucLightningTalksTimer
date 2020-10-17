//
//  ContentView.swift
//  IucLightningTalksTimer
//
//  Created by 梁海 on 10/17/20.
//

import SwiftUI

struct ContentView: View {

    static let defaultHours = 0
    static let defaultMinutes = 5
    static let defaultSeconds = 0

//    let text = "مرحبا يا ليانج"
    let text = "See you all next year! 🎉"

    @State var hours: Int = ContentView.defaultHours
    @State var minutes: Int = ContentView.defaultMinutes
    @State var seconds: Int = ContentView.defaultSeconds

    @State var timer: Timer?
    @State var isRunning = false

    @State var color: Color = .blue
    let colors: [Color] = [.blue, .green, .orange, .pink, .purple, .red, .yellow]
//    let colors: [Color] = [.blue, .green]

    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            if hours == 0, minutes == 0, seconds == 0 {
                stopTimer()
            } else if seconds == 0 {
                seconds = 59
                if minutes == 0 {
                    minutes = 59
                    hours -= 1
                } else {
                    minutes -= 1
                }
            } else {
                seconds -= 1
            }
        }
    }

    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }

    var body: some View {

        VStack {

            Spacer()

//            Text("\(minutes):\(String(format: "%02d", seconds))")
//                .font(Font.system(size: 400, weight: .regular, design: .rounded).monospacedDigit())
//                .bold()
//                .foregroundColor(
//                    minutes > 0 ? .white
//                        : seconds > 10 ? .orange
//                            : seconds > 0 ? .red : .white
//                )

            Text(text)
                .font(Font.system(size: 180, weight: .black, design: .rounded).monospacedDigit())
                .padding(.bottom)
                .foregroundColor(color)
//                .bold()
//                .foregroundColor(
//                    minutes > 0 ? .white
//                        : seconds > 10 ? .orange
//                        : seconds > 0 ? .red : .white
//                )

//            HStack {
//
//                Spacer()
//
//                Button {
//                    !isRunning ? startTimer() : stopTimer()
//                } label: {
//                    !isRunning
//                        ? Image(systemName: "play.circle.fill").accentColor(.white)
//                        : Image(systemName: "pause.circle.fill").accentColor(.white)
//                }
//                .disabled(hours == 0 && minutes == 0 && seconds == 0)
//                .padding()
//
//                Button {
//                    hours = ContentView.defaultHours
//                    minutes = ContentView.defaultMinutes
//                    seconds = ContentView.defaultSeconds
//                    stopTimer()
//                } label: {
//                    Image(systemName: "stop.circle.fill").accentColor(.white)
//                }
//                .disabled(hours == ContentView.defaultHours && minutes == ContentView.defaultMinutes && seconds == ContentView.defaultSeconds)
//                .padding()
//
//                Spacer()
//            }.font(Font.system(size: 100, weight: .heavy))
//
//            Text("Lightning Talks, IUC #44")
//                .font(Font.system(size: 80, weight: .heavy))
//                .padding()

//            Text("44th Internationalization & Unicode Conference")
//                .font(Font.system(size: 50, weight: .heavy))
//                .padding()

            Text("IUC #44, 14–16 October 2020")
                .font(Font.system(size: 50, weight: .heavy))
                .padding(.top)
                .foregroundColor(.white)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                        let oldColor = color
//                        var newColor = color
                        while color == oldColor {
                            color = colors.randomElement() ?? oldColor
                        }
                    }
                }

            Spacer()
            Spacer()
        }
        .background(
            minutes > 0 ? Color.clear
                : seconds > 10 ? .clear
                : seconds > 0 ? .clear : .red
        )
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}
