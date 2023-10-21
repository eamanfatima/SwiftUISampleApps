//
//  ContentView.swift
//  AboutMe
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            Favorites()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            FunFacts()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}

#Preview {
    ContentView()
}
