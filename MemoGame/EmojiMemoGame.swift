//
//  EmojiMemoGame.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 05/08/22.
//

import Foundation

class EmojiMemoGame: ObservableObject {
    static let emojis =
        ["✈️", "🖥", "🧑🏻‍🏫", "☠️", "🤡", "👺", "🤖", "🧚‍♀️", "🧶", "👑", "🐼", "🐸", "🍔", "🍟"]
    
    static func createMemoGame() -> MemoGame<String> {
        MemoGame<String>(numberOfPairsOfCards: 4) { index in
            emojis[index]
        }
    }
    
    @Published private var model: MemoGame<String> = createMemoGame()
        
    var cards: Array<MemoGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoGame<String>.Card) {
        model.choose(card)
    }
}
