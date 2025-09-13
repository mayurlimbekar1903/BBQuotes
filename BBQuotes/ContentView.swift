//
//  ContentView.swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 20/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Beaking BAd", systemImage: "tortoise", content: {
            QuoteView(show: "Breaking Bad")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            })
            
            Tab("Better call saul", systemImage: "briefcase") {
                QuoteView(show: "Better Call Saul")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
