import SwiftUI

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(subject: "Lightning Talks, IUC #44", seconds: 11)
            .preferredColorScheme(.dark)
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}

struct TimerView: View {

    let subject: String
    let initial: TimeInterval
    let formatter = DateComponentsFormatter()

    @State var remaining: TimeInterval = 0
    @State var timer: Timer?

    init(subject: String, seconds: Int) {
        self.subject = subject
        initial = TimeInterval(seconds)
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = []
    }

    var body: some View {

        VStack {

            Text(formatter.string(from: remaining) ?? "")
                .font(Font.system(size: 400, weight: .bold, design: .rounded).monospacedDigit())
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .foregroundColor(
                    remaining > 60 ? Color(.label)
                        : remaining > 10 ? Color(.systemOrange)
                        : remaining > 0 ? Color(.systemRed) : Color(.label)
                )
                .onAppear { remaining = initial }

            VStack(spacing: 50) {

                HStack(spacing: 100) {

                    Button(action: timer == nil ? start : pause) {
                        timer == nil
                            ? Image(systemName: "play.circle.fill")
                            : Image(systemName: "pause.circle.fill")
                    }
                    .disabled(remaining == 0)

                    Button(action: reset) {
                        Image(systemName: "stop.circle.fill")
                    }
                    .disabled(remaining == initial)
                }
                .font(Font.system(size: 100, weight: .heavy))
                .accentColor(Color(.label))

                Text(subject)
                    .font(Font.system(size: 80, weight: .heavy))
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(remaining > 0 ? Color(.clear) : Color(.systemRed))
    }

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remaining == 0 {
                pause()
            } else {
                remaining -= 1
            }
        }
    }
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    func reset() {
        pause()
        remaining = initial
    }
}
