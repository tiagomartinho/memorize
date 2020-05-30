import SwiftUI

struct EmojiMemoryCardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            Text(self.viewModel.themeName)
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                    }
            }
            .padding()
            .foregroundColor(self.viewModel.themeColor)
            HStack(spacing: 50) {
                Text("Current Score: \(self.viewModel.score)")
                Button(action: {
                    self.viewModel.newGame()
                }, label: { Text("New Game") })
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryCardView(viewModel: EmojiMemoryGame())
    }
}
