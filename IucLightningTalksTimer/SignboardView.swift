import SwiftUI

struct SignboardView_Previews: PreviewProvider {
    static var previews: some View {
        SignboardView(subject: "IUC #44, 14–16 October 2020", text: "See you next year!")
            .preferredColorScheme(.dark)
            .previewDevice("iPad Pro (11-inch) (2nd generation)")
    }
}

struct SignboardView: View {

    let subject: String
    let text: String

    @State var color = Self.colors[0]

    static let colors: [Color] = [
        UIColor.systemBlue, .systemGreen, .systemIndigo, .systemOrange, .systemPink, .systemPurple, .systemRed,
        .systemTeal, .systemYellow
    ].map(Color.init)

    var body: some View {
        VStack(spacing: 50) {
            Text(text)
                .font(Font.system(size: 200, weight: .black, design: .rounded).monospacedDigit())
                .foregroundColor(color)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                        let oldColor = color
                        while color == oldColor { color = Self.colors.randomElement() ?? oldColor }
                    }
                }
            Text(subject)
                .font(Font.system(size: 50, weight: .heavy))
                .foregroundColor(.white)
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
}
