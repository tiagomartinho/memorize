import SwiftUI

struct CardView: View {
    var card: EmojiMemoryGameCard

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
        .aspectRatio(2 / 3, contentMode: .fit)
        .animation(.default)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(card: EmojiMemoryGameCard(id: 1, isFaceUp: true, isMatched: false, content: "🎸"))
            CardView(card: EmojiMemoryGameCard(id: 2, content: ""))
        }
    }
}
