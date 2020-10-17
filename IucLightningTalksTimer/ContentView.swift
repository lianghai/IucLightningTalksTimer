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

    let iuc = "IUC #44, 14–16 October 2020"
    let seeYou = "See you next year!"

    var body: some View {
        TimerView(subject: lightningTalks, seconds: timeLimit)
//        SignboardView(subject: iuc, text: seeYou)
    }
}
