//
//  SevensApp.swift
//  Sevens
//
//  Created by Jared Tamulynas on 12/22/20.
//

import SwiftUI

@main
struct SevensApp: App {
    @StateObject var cardDeck = CardDeck()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cardDeck)
        }
    }
}
