//
//  MemoModel.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 05/08/22.
//

import Foundation

struct MemoGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfCurrentMatchingCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } }
    }
    
    struct Card: Identifiable {
        let id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(content: content))
            cards.append(Card( content: content))
        }
        cards.shuffle()
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
                cards[choosenCardIndex].isFaceUp = true
            } else {
                indexOfCurrentMatchingCard = choosenCardIndex
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}

extension Array {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
