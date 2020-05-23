class EmojiMemoryGame {
    private var model: MemoryGame<String> = {
        let emojis = HalloweenEmojis.value
            .shuffled()
            .prefix(Int.random(in: 2 ... 5))
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {
            emojis[$0]
        }
    }()

    var cards: [EmojiMemoryGameCard] {
        model.cards
    }

    func choose(card: EmojiMemoryGameCard) {
        model.choose(card: card)
    }
}
