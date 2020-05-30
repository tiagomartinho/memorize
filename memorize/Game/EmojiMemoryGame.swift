import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var currentTheme: EmojiMemoryGameTheme?
    @Published private var model: MemoryGame<String>?

    var themeName: String {
        currentTheme?.name ?? ""
    }

    var themeColor: Color {
        currentTheme?.color ?? .clear
    }

    var cards: [EmojiMemoryGameCard] {
        model?.cards ?? []
    }

    func choose(card: EmojiMemoryGameCard) {
        model?.choose(card: card)
    }

    func newGame() {
        let randomTheme = EmojiMemoryGameTheme.random
        model = buildGameModel(with: randomTheme)
        currentTheme = randomTheme
    }

    private func buildGameModel(with theme: EmojiMemoryGameTheme) -> MemoryGame<String> {
        let emojis = theme.emojis
            .shuffled()
            .prefix(theme.numberOfCards)
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {
            emojis[$0]
        }
    }
}
