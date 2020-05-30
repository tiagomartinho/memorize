import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let indicesCardsFacingUp = cards.indices.filter { cards[$0].isFaceUp }
            let onlyOneCardIsFacingUp = indicesCardsFacingUp.count == 1
            return onlyOneCardIsFacingUp ? indicesCardsFacingUp.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    mutating func choose(card: Card) {
        guard let choosenIndex = (cards.firstIndex { $0.id == card.id }) else { return }
        guard !cards[choosenIndex].isFaceUp else { return }
        guard !cards[choosenIndex].isMatched else { return }
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                cards[choosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[choosenIndex].isFaceUp = true
        } else {
            indexOfTheOneAndOnlyFaceUpCard = choosenIndex
        }
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
