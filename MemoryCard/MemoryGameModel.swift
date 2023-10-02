//
//  MemoryGame.swift
//  MemoryCard
//
//  Created by Matthew on 2023/10/1.
//

import Foundation

struct MemoryGameModel {
    let items = ["🤡", "👹", "👿", "👺", "💩", "👻", "🤖", "🙀", "🤢", "👁️", "💈"]

    init(_ numOfCards: Int) {
        cards = []
        for index in 0..<numOfCards {
            cards.append(Card(id: "\(index)a", title: items[index]))
            cards.append(Card(id: "\(index)b", title: items[index]))
        }
    }
    
    mutating func pick(_ card: Card) {
        if let index = cards.firstIndex(of: card) {
            cards[index].isFaceUp = true
            switch faceUpCards.count {
            case 1:
                return
            case 2:
                if faceUpCards[0].title == faceUpCards[1].title {
                    markCardsMatch(card)
                }
            default:
                markAllCardsFaceDownExcept(card)
            }
        }
    }
    
    mutating func markCardsMatch(_ card: Card) {
        for index in cards.indices {
            if cards[index].title == card.title {
                cards[index].isMatched = true
            }
        }
    }
    
    mutating func markAllCardsFaceDownExcept(_ card: Card) {
        for index in cards.indices {
            if card.id != cards[index].id {
                cards[index].isFaceUp = false
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    mutating func reset() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
    }
    
    struct Card: Hashable, Identifiable, CustomDebugStringConvertible {
        var id: String
        var title: String
        var isFaceUp = false
        var isMatched = false

        var debugDescription: String {
            return "\(title)"
        }
    }
    
    private(set) var cards: [Card]
    
    private var faceUpCards: [Card] {
        cards.filter({card in
            card.isFaceUp
        })
    }
}
