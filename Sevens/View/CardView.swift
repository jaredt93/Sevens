//
//  CardView contains the current card.
//
//  Created by Jared Tamulynas on 3/22/21.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var cardDeck: CardDeck

    var body: some View {
        Button(action: {
            cardDeck.cardTapped()
        }) {
            if cardDeck.cards[cardDeck.currentCard].suit != "diamond" || cardDeck.cards[cardDeck.currentCard].value != "K" {
                VStack {
                    Text(cardDeck.cards[cardDeck.currentCard].value)
                        .font(.system(size: 220))
                        .padding(.bottom)

                    Image(systemName: "suit.\(cardDeck.cards[cardDeck.currentCard].suit).fill")
                        .font(.system(size: 120))
                }
                .padding(.bottom, 50)
                .opacity(cardDeck.animationOpacity)
                .frame(maxWidth: .infinity)
            } else {
                VStack {
                    Text(cardDeck.cards[cardDeck.currentCard].value)
                        .font(.system(size: 220))
                        .padding(.bottom)

                    Text("BIG RICH!")
                        .font(.system(size: 30))
                        .bold()

                    Image("beard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                .opacity(cardDeck.animationOpacity)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().environmentObject(CardDeck())
    }
}
