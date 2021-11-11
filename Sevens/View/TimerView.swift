//
//  TimerView.swift
//  Sevens
//
//  Created by Jared Tamulynas on 3/22/21.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var cardDeck: CardDeck
    // Timer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // Time remaining in timer
    @State private var timeRemaining = 30
    let drinkAmount = ["TAKE A SIP", "FINISH HALF YOUR DRINK", "FINISH YOUR DRINK", "WATERFALL"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()

                    Button(action: {
                        cardDeck.exitTimer()
                        
                        if cardDeck.sevens == 0 {
                            cardDeck.showingAlert = true
                            cardDeck.newGame()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title3)
                    }
                }
                .padding()

                Text("\(timeRemaining)")
                    .font(.system(size: geometry.size.height / 4))
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 1.5)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }
                
                Spacer()
            }
            .foregroundColor(cardDeck.cards[cardDeck.currentCard].suit == "heart" || cardDeck.cards[cardDeck.currentCard].suit == "diamond" ? .red : .primary)
            .contentShape(Rectangle())
            .onTapGesture {
                if timeRemaining == 0 {
                    cardDeck.exitTimer()
                    
                    if cardDeck.sevens == 0 {
                        cardDeck.showingAlert = true
                        cardDeck.newGame()
                    }
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(CardDeck())
    }
}
