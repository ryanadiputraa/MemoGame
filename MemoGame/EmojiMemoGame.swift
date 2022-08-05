//
//  EmojiMemoGame.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 05/08/22.
//

import Foundation

class EmojiMemoGame {
    static let emojis =
        ["✈️", "🖥", "🧑🏻‍🏫", "☠️", "🤡", "👺", "🤖", "🧚‍♀️", "🧶", "👑", "🐼", "🐸", "🍔", "🍟"]
    
    static func createMemoGame() -> MemoGame<String> {
        MemoGame<String>(numberOfPairsOfCards: 4) { index in
            emojis[index]
        }
    }
    
    private var model: MemoGame<String> = createMemoGame()
        
    var cards: [MemoGame<String>.Card] {
        return model.cards
    }
}
