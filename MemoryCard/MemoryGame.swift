//
//  MemoryGameViewModel.swift
//  MemoryCard
//
//  Created by 李馨华 on 2023/10/2.
//

import SwiftUI

class MemoryGame: ObservableObject {
    @Published private var model = MemoryGameModel(11)
    
    var cards: [MemoryGameModel.Card] {
        return model.cards
    }
    
    func pickCard(_ card: MemoryGameModel.Card) {
        model.pick(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
