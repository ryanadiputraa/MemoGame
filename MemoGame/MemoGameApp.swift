//
//  MemoGameApp.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 03/08/22.
//

import SwiftUI

@main
struct MemoGameApp: App {
    private let game = EmojiMemoGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoGameView(game: game)
        }
    }
}
