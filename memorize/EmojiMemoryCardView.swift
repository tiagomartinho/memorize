import SwiftUI

struct EmojiMemoryCardView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var cardFont: Font {
        return viewModel.cards.count >= 5 ? .headline : .largeTitle
    }

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                    }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryCardView(viewModel: EmojiMemoryGame())
    }
}
