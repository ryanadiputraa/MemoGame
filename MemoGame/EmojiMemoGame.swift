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
        ["✈️", "🖥", "🧑🏻‍🏫", "☠️", "🤡", "👺", "🤖", "🧚‍♀️", "🧶", "👑", "🐼", "🐸", "🍔", "🍟"]
    
    private static func createMemoGame() -> MemoGame<String> {
        MemoGame<String>(numberOfPairsOfCards: 4) { index in
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
}
