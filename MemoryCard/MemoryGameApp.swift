//
//  MemoryCardApp.swift
//  MemoryCard
//
//  Created by 李馨华 on 2023/10/1.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = MemoryGame()
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewModel: game)
        }
    }
}
