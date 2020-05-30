import SwiftUI

struct CardView: View {
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3

    private func font(for size: CGSize) -> Font {
        return .system(size: min(size.width, size.height) * 0.75)
    }

    var card: EmojiMemoryGameCard

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
        .padding(3)
        .animation(.default)
        .font(font(for: size))
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
