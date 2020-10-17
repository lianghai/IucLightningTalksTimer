import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}

struct ContentView: View {
    var body: some View {
        TimerView()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}
