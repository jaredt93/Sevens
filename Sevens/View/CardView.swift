//
//  CardView contains the current card.
//
//  Created by Jared Tamulynas on 3/22/21.
//

import SwiftUI

public struct ColorBlended: ViewModifier {
  fileprivate var color: Color
  
  public func body(content: Content) -> some View {
    VStack {
      ZStack {
        content
        color.blendMode(.sourceAtop)
      }
      .drawingGroup(opaque: false)
    }
  }
}

extension View {
  public func blending(color: Color) -> some View {
    modifier(ColorBlended(color: color))
  }
}

struct CardView: View {
    @EnvironmentObject var cardDeck: CardDeck

    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                cardDeck.cardTapped()
            }) {
                if cardDeck.cards[cardDeck.currentCard].suit != "spade" || cardDeck.cards[cardDeck.currentCard].value != "A" {
                    VStack {
                        Text(cardDeck.cards[cardDeck.currentCard].value)
                            .font(.system(size: geometry.size.height / 2.75))
                        
                        Image(systemName: "suit.\(cardDeck.cards[cardDeck.currentCard].suit).fill")
                            .font(.system(size: geometry.size.height / 4.5))
                            .padding(.top, 35)
                            
                    }
                    .opacity(cardDeck.animationOpacity)
                    .frame(maxWidth: .infinity)
                } else {
                    VStack {
                        Image("AceLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 1.25, height: geometry.size.height / 3)
                            .padding(50)
                            
                        HStack {
                            Spacer()
                            
                            Image("AceAboveMedia")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 2.5, height: geometry.size.height / 3)
                            
                            Spacer()
                        }
                    }
                    .blending(color: cardDeck.cards[cardDeck.currentCard].suit == "heart" || cardDeck.cards[cardDeck.currentCard].suit == "diamond" ? .red : .primary)
                    .frame(height: geometry.size.height / 1.25)
                    .opacity(cardDeck.animationOpacity)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().environmentObject(CardDeck())
    }
}
