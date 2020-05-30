import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]

    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        guard let cardIndex = (cards.firstIndex { $0.id == card.id }) else { return }
        cards[cardIndex].isFaceUp.toggle()
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
