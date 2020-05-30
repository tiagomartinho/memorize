import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var seenCardsIDs = Set<Int>()
    private(set) var score = 0

    private var indexOfTheOnlyFaceUpCard: Int? {
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
        guard let choosenCardIndex = (cards.firstIndex { $0.id == card.id }) else { return }
        let notMatchedAndNotFacingUp = !cards[choosenCardIndex].isFaceUp && !cards[choosenCardIndex].isMatched
        guard notMatchedAndNotFacingUp else { return }
        if let faceUpCardIndex = indexOfTheOnlyFaceUpCard {
            tryToMatch(faceUpCardIndex, with: choosenCardIndex)
            cards[choosenCardIndex].isFaceUp = true
        } else {
            indexOfTheOnlyFaceUpCard = choosenCardIndex
        }
    }

    private mutating func tryToMatch(_ faceUpCardIndex: Int, with choosenCardIndex: Int) {
        if cards[choosenCardIndex].content == cards[faceUpCardIndex].content {
            cards[choosenCardIndex].isMatched = true
            cards[faceUpCardIndex].isMatched = true
            score += 2
        } else {
            if seenCardsIDs.contains(cards[choosenCardIndex].id) {
                score -= 1
            }
            if seenCardsIDs.contains(cards[faceUpCardIndex].id) {
                score -= 1
            }
        }
        seenCardsIDs.insert(cards[choosenCardIndex].id)
        seenCardsIDs.insert(cards[faceUpCardIndex].id)
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
