//
//  Maintains the current card deck.
//
//  Created by Jared Tamulynas on 3/22/21.
//

import Foundation
import SwiftUI

class CardDeck: ObservableObject {
    // Current card in the deck
    @Published var currentCard = 0
    // Number of sevens remaining
    @Published var sevens = 4
    // Boolean flag whether current card is a seven
    @Published var isSeven = false
    // Boolean flag to show timer view
    @Published var timerFlag = false
    // Boolean flag to start game
    @Published var play = false
    // Boolean flag whether to show an alert
    @Published var showingAlert = false
    // Alert title
    @Published var alertTitle = "No more sevens left"
    // Alert message
    @Published var alertMessage = "Shuffle the deck and play again!"
    // Scale animation variable
    @Published var animationOpacity = 1.0
    // 52 card deck
    @Published var cards: [(value: String, suit: String)] =
                           [("2", "club"), ("2", "diamond"), ("2", "heart"), ("2", "spade"),
                            ("3", "club"), ("3", "diamond"), ("3", "heart"), ("3", "spade"),
                            ("4", "club"), ("4", "diamond"), ("4", "heart"), ("4", "spade"),
                            ("5", "club"), ("5", "diamond"), ("5", "heart"), ("5", "spade"),
                            ("6", "club"), ("6", "diamond"), ("6", "heart"), ("6", "spade"),
                            ("7", "club"), ("7", "diamond"), ("7", "heart"), ("7", "spade"),
                            ("8", "club"), ("8", "diamond"), ("8", "heart"), ("8", "spade"),
                            ("9", "club"), ("9", "diamond"), ("9", "heart"), ("9", "spade"),
                            ("10", "club"), ("10", "diamond"), ("10", "heart"), ("10", "spade"),
                            ("J", "club"), ("J", "diamond"), ("J", "heart"), ("J", "spade"),
                            ("Q", "club"), ("Q", "diamond"), ("Q", "heart"), ("Q", "spade"),
                            ("K", "club"), ("K", "diamond"), ("K", "heart"), ("K", "spade"),
                            ("A", "club"), ("A", "diamond"), ("A", "heart"), ("A", "spade")].shuffled()

    // Method runs when user taps the card
    func cardTapped() {
        if cards[currentCard].value == "7" || cards[currentCard].value == "K" && cards[currentCard].suit == "diamond" {
            isSeven = true
            timerFlag = true
            animationOpacity = 1.0
        } else {
            currentCard += 1
        }
        
        checkSeven()
    }
    
    // Check and animate Sevens
    func checkSeven() {
        if cards[currentCard].value == "7" || cards[currentCard].value == "K" && cards[currentCard].suit == "diamond" {
            animationOpacity = 0
            
            withAnimation(Animation.linear(duration: 0.5).repeatForever(autoreverses: true)) {
                animationOpacity = 1.0
            }
            animationOpacity = 1.0
            
        } else {
            animationOpacity = 0
            
            withAnimation(Animation.easeIn(duration: 1)) {
                animationOpacity = 1.0
            }
            animationOpacity = 1.0
            isSeven = false
        }
    }
    
    // Exits the Timer early
    func exitTimer() {
        if cards[currentCard].value == "7" {
            sevens -= 1
        }
        
        if currentCard < 51 {
            currentCard += 1
        }
        
        animationOpacity = 1.0
        checkSeven()
        timerFlag = false
    }
    
    // Method runs when user taps shuffle button in top right
    func newGame() {
        cards = cards.shuffled()
        currentCard = 0
                
        var bToBSevens = true
        
        while (cards[0].value == "7" || bToBSevens) {
            cards = cards.shuffled()
            
            bToBSevens = false
                
            for cardNumber in 0 ..< 51 {
                if (cards[cardNumber].value == "7" && cards[cardNumber + 1].value == "7") || ((cards[cardNumber].value == "K" && cards[currentCard].suit == "diamond") && cards[cardNumber + 1].value == "7") {
                    bToBSevens = true
                    break
                }
            }
        }
        
        timerFlag = false
        isSeven = false
        sevens = 4
        
        animationOpacity = 1.0
        
        withAnimation(Animation.easeIn(duration: 1)) {
            animationOpacity = 1.0
        }
        animationOpacity = 1.0
    }
    
    func openLink(website: String) {
        if let url = URL(string: website) {

        UIApplication.shared.open(url)

        }
    }

}
