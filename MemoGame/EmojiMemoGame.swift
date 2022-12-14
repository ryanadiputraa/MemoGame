//
//  EmojiMemoGame.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 05/08/22.
//

import Foundation

class EmojiMemoGame: ObservableObject {
    typealias Card = MemoGame<String>.Card
    
    private static let emojis =
        [
            "โ๏ธ", "๐ฅ", "๐ง๐ปโ๐ซ", "โ ๏ธ", "๐คก", "๐บ", "๐ค", "๐งโโ๏ธ", "๐งถ", "๐", "๐ผ", "๐ธ", "๐", "๐",
            "๐", "๐", "๐", "๐ซฅ", "๐", "๐ค", "๐", "๐ฅ", "๐ฎ๐ป"
        ]
    
    private static func createMemoGame() -> MemoGame<String> {
        MemoGame<String>(numberOfPairsOfCards: 10) { index in
            emojis[index]
        }
    }
    
    @Published private var model = createMemoGame()
        
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
