//
//  StartView.swift
//  Sevens
//
//  Created by Jared Tamulynas on 4/28/21.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var cardDeck: CardDeck
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "suit.spade.fill")
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.red)
            }
            .font(.system(size: 50))
            .padding()
            
            Button(action: {
                cardDeck.newGame()
                cardDeck.play = true
            }) {
                Text("TAP TO PLAY")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            HStack {
                Image(systemName: "suit.diamond.fill")
                    .foregroundColor(.red)
                Spacer()
                Image(systemName: "suit.club.fill")
                    .foregroundColor(.primary)
            }
            .font(.system(size: 50))
            .padding()
            
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
