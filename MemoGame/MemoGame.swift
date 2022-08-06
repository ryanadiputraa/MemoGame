//
//  MemoModel.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 05/08/22.
//

import Foundation

struct MemoGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfCurrentMatchingCard: Int?
    
    struct Card: Identifiable {
        var id = UUID()
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
    
    mutating func choose(_ card: Card) {
        if let choosenCardIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[choosenCardIndex].isFaceUp,
           !cards[choosenCardIndex].isMatched
        {
            if let matchingCardIndex = indexOfCurrentMatchingCard {
                if cards[matchingCardIndex].content == cards[choosenCardIndex].content {
                    cards[matchingCardIndex].isMatched = true
                    cards[choosenCardIndex].isMatched = true
                }
                indexOfCurrentMatchingCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfCurrentMatchingCard = choosenCardIndex
            }
            cards[choosenCardIndex].isFaceUp.toggle()
        }
    }
}
