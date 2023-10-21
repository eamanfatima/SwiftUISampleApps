//
//  ContentView.swift
//  Choose Your Own Story
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            StoryPageView(story: StoryData.story, pageIndex: 0)
        }
        
    }
}

#Preview {
    ContentView()
}
