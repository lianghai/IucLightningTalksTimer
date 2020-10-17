import SwiftUI

struct SignboardView_Previews: PreviewProvider {
    static var previews: some View {
        SignboardView()
    }
}

struct SignboardView: View {

    @State var color: Color = .blue

    let text = "See you all next year! 🎉"
    let colors: [Color] = [.blue, .green, .orange, .pink, .purple, .red, .yellow]

    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(Font.system(size: 180, weight: .black, design: .rounded).monospacedDigit())
                .padding(.bottom)
                .foregroundColor(color)
            Text("IUC #44, 14–16 October 2020")
                .font(Font.system(size: 50, weight: .heavy))
                .padding(.top)
                .foregroundColor(.white)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                        let oldColor = color
                        while color == oldColor {
                            color = colors.randomElement() ?? oldColor
                        }
                    }
                }
            Spacer()
            Spacer()
        }
    }
}
