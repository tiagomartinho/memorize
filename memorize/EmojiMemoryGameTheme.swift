import SwiftUI

struct EmojiMemoryGameTheme {
    let name: String
    let emojis: Set<String>
    let numberOfCards: Int
    let color: Color

    init(name: String, emojis: Set<String>, numberOfCards: Int = Int.random(in: 3 ... 10), color: Color) {
        self.name = name
        self.emojis = emojis
        self.numberOfCards = numberOfCards
        self.color = color
    }
}
