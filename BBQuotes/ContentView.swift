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
            Tab(Conststant.bbName, systemImage: "tortoise", content: {
                FetchView(show: Conststant.bbName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            })
            
            Tab(Conststant.bcsName, systemImage: "briefcase") {
                FetchView(show: Conststant.bcsName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab(Conststant.ecName, systemImage: "car") {
                FetchView(show: Conststant.ecName)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
