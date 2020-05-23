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
        .font(.largeTitle)
    }
}
