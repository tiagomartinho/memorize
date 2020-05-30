import SwiftUI

struct EmojiMemoryCardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                    }
            }
            .padding()
            .foregroundColor(self.viewModel.themeColor)
            Button(action: {
                self.viewModel.newGame()
                }, label: { Text("New Game") })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryCardView(viewModel: EmojiMemoryGame())
    }
}
