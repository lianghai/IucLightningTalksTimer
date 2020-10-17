import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}

struct ContentView: View {
    let lightningTalks = "Lightning Talks, IUC #44"
    let timeLimit = 5 * 60
    var body: some View {
        TimerView(countDown: timeLimit, for: subject)
        TimerView(subject: lightningTalks, seconds: timeLimit)
    }
}
