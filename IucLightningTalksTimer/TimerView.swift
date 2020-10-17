import SwiftUI

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

struct TimerView: View {

    static let defaultHours = 0
    static let defaultMinutes = 5
    static let defaultSeconds = 0

    @State var hours: Int = TimerView.defaultHours
    @State var minutes: Int = TimerView.defaultMinutes
    @State var seconds: Int = TimerView.defaultSeconds

    @State var timer: Timer?
    @State var isRunning = false

    var body: some View {

        VStack {

            Spacer()

            Text("\(minutes):\(String(format: "%02d", seconds))")
                .font(Font.system(size: 400, weight: .regular, design: .rounded).monospacedDigit())
                .bold()
                .foregroundColor(
                    minutes > 0 ? .white
                        : seconds > 10 ? .orange
                        : seconds > 0 ? .red : .white
                )

            HStack {

                Spacer()

                Button {
                    !isRunning ? startTimer() : stopTimer()
                } label: {
                    !isRunning
                        ? Image(systemName: "play.circle.fill").accentColor(.white)
                        : Image(systemName: "pause.circle.fill").accentColor(.white)
                }
                .disabled(hours == 0 && minutes == 0 && seconds == 0)
                .padding()

                Button {
                    hours = TimerView.defaultHours
                    minutes = TimerView.defaultMinutes
                    seconds = TimerView.defaultSeconds
                    stopTimer()
                } label: {
                    Image(systemName: "stop.circle.fill").accentColor(.white)
                }
                .disabled(hours == TimerView.defaultHours && minutes == TimerView.defaultMinutes && seconds == TimerView.defaultSeconds)
                .padding()

                Spacer()

            }.font(Font.system(size: 100, weight: .heavy))

            Text("Lightning Talks, IUC #44")
                .font(Font.system(size: 80, weight: .heavy))
                .padding()

            Spacer()
        }
        .background(
            minutes > 0 ? Color.clear
                : seconds > 10 ? .clear
                : seconds > 0 ? .clear : .red
        )
    }

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
}
