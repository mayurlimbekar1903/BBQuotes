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
            Text("Breaking bad view")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            })
            
            Tab("Better call saul", systemImage: "briefcase") {
                Text("Better Call Saul view")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
