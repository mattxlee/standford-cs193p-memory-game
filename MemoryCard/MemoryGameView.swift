//
//  ContentView.swift
//  MemoryCard
//
//  Created by Matthew on 2023/10/1.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGame
    var body: some View {
        VStack {
            Cards(viewModel: viewModel, cards: viewModel.cards)
            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffle()
                }
            }
        }
    }
}

struct Cards: View {
    let viewModel: MemoryGame
    let cards: [MemoryGameModel.Card]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 0)], spacing: 0, content: {
                ForEach(cards) { card in
                    Card(viewModel: viewModel, card: card)
                        .padding(4)
                }
            })
        }
        .padding()
        Spacer()
    }
}

struct Card: View {
    let viewModel: MemoryGame
    let card: MemoryGameModel.Card
    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                RoundedRectangle(cornerRadius: 12).fill(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text(card.title)
                    .font(.system(size: 50))
                    .minimumScaleFactor(0.01)
            } else {
                RoundedRectangle(cornerRadius: 12).fill(.cyan)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .rotation3DEffect(.degrees(card.isFaceUp || card.isMatched ? 0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
        .onTapGesture {
            withAnimation {
                viewModel.pickCard(card)
            }
        }
    }
}

#Preview {
    MemoryGameView(viewModel: MemoryGame())
}
