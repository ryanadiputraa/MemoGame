//
//  Cardify.swift
//  MemoGame
//
//  Created by Ryan Adi Putra on 13/08/22.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var isMatchedUp: Bool
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else if isMatchedUp {
                shape.opacity(0)
            } else {
                shape.fill()
            }
            content.opacity(isFaceUp ? 1 : 0)
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool, isMatchedUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isMatchedUp: isMatchedUp))
    }
}
