//
//  HeaderView containing cards left indicator and a shuffle button
//
//  Created by Jared Tamulynas on 4/1/21.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var cardDeck: CardDeck
    
    var body: some View {
        HStack {
            Text("\(cardDeck.cards.count - cardDeck.currentCard) cards left")
            
            Spacer()
            
            Button(action: {
                cardDeck.newGame()
            }) {
                Text("New Deck")
                Image(systemName: "shuffle")
            }
        }
        .font(.title3)
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView().environmentObject(CardDeck())
    }
}
