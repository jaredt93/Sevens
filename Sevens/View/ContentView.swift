//
//  A card application that goes through a deck of cards stopping on 7's.
//
//  Created by Jared Tamulynas on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cardDeck: CardDeck
    
    // Main body
    var body: some View {
        Group {
            if !cardDeck.play {
                StartView()
            } else if cardDeck.timerFlag {
                TimerView()
            } else {
                GameView()
            }
        }
        .alert(isPresented: $cardDeck.showingAlert) {
            Alert(title: Text(cardDeck.alertTitle), message: Text(cardDeck.alertMessage), dismissButton: .default(Text("Play Again!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CardDeck())
    }
}
