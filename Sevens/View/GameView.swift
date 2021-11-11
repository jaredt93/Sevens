//
//  GameView.swift
//  Sevens
//
//  Created by Jared Tamulynas on 4/1/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var cardDeck: CardDeck
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView()
                CardView()
                SevensRemainingView()
            }
        }
        .foregroundColor(cardDeck.cards[cardDeck.currentCard].suit == "heart" || cardDeck.cards[cardDeck.currentCard].suit == "diamond" ? .red : .primary)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(CardDeck())
    }
}
