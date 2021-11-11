//
//  SevensRemainingView shows how many sevens are left in the deck.
//
//  Created by Jared Tamulynas on 3/31/21.
//

import SwiftUI

struct SevensRemainingView: View {
    @EnvironmentObject var cardDeck: CardDeck
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            ForEach(0 ..< cardDeck.sevens, id: \.self) { _ in
                Image(systemName: "7.circle.fill")
                    .padding(10)
            }
        }
        .font(.largeTitle)
        .padding(.bottom)
    }
}

struct SevensRemainingView_Previews: PreviewProvider {
    static var previews: some View {
        SevensRemainingView().environmentObject(CardDeck())
    }
}
