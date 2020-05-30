extension EmojiMemoryGameTheme {
    static var all: [EmojiMemoryGameTheme] = [EmojiMemoryGameTheme(name: "Halloween",
                                                                   emojis: HalloweenEmojis.value,
                                                                   numberOfCards: 6,
                                                                   color: .orange),
                                              EmojiMemoryGameTheme(name: "Nature",
                                                                   emojis: NatureEmojis.value,
                                                                   numberOfCards: 4,
                                                                   color: .blue),
                                              EmojiMemoryGameTheme(name: "Activity",
                                                                   emojis: ActivityEmojis.value,
                                                                   color: .red)]

    static var random: EmojiMemoryGameTheme { all.randomElement()! }
}
