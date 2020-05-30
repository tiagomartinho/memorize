import XCTest
@testable import memorize

class MemoryGameTest: XCTestCase {

//    Keep score in your game by giving 2 points for every match
//    and penalizing 1 point for every previously seen card that is involved in a mismatch

    func testStartsWithEmptyScore() {
        let cards = ["A"]
        let game = MemoryGame<String>(numberOfPairsOfCards: cards.count) { cards[$0] }

        XCTAssertEqual(0, game.score)
    }

    func testGivesPointsforMatch() {
        let cards = ["A"]
        var game = MemoryGame<String>(numberOfPairsOfCards: cards.count) { cards[$0] }

        let first = MemoryGame<String>.Card(id: 0, content: "A")
        let second = MemoryGame<String>.Card(id: 1, content: "A")
        game.choose(card: first)
        game.choose(card: second)

        XCTAssertEqual(2, game.score)
    }

    func testDoNotPenalizesForFirstMismatch() {
        let cards = ["A", "B"]
        var game = MemoryGame<String>(numberOfPairsOfCards: cards.count) { cards[$0] }

        let first = MemoryGame<String>.Card(id: 0, content: "A")
        let second = MemoryGame<String>.Card(id: 2, content: "B")
        game.choose(card: first)
        game.choose(card: second)

        XCTAssertEqual(0, game.score)
    }

    func testPenalizesForPreviouslySeenCardInMismatch() {
        let cards = ["A", "B"]
        var game = MemoryGame<String>(numberOfPairsOfCards: cards.count) { cards[$0] }

        let first = MemoryGame<String>.Card(id: 0, content: "A")
        let second = MemoryGame<String>.Card(id: 2, content: "B")
        let third = MemoryGame<String>.Card(id: 1, content: "A")
        game.choose(card: first)
        game.choose(card: second)

        game.choose(card: third)
        game.choose(card: second)

        XCTAssertEqual(-1, game.score)
    }
}
