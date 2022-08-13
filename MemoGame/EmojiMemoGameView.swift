//
//  EmojiMemoGameView.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 03/08/22.
//

import SwiftUI

struct EmojiMemoGameView: View {
    @ObservedObject var game: EmojiMemoGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoGame.Card
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 120-90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoGame()
        game.choose(game.cards.first!)
        return EmojiMemoGameView(game: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
//        EmojiMemoGameView(game: game)
//            .preferredColorScheme(.dark)
    }
}
