//
//  MemoModel.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 05/08/22.
//

import Foundation

struct MemoGame<CardContent> {
    private(set) var cards: [Card]
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(content: content))
            cards.append(Card( content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
}
