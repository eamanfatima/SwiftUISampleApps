//
//  StoryPageView.swift
//  Choose Your Own Story
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct StoryPageView: View {
    
    let story: Story
    let pageIndex: Int
    
    var body: some View {
        VStack {
            ScrollView {
                Text(story[pageIndex].text)
                    .lineSpacing(8)
            }
            ForEach(story[pageIndex].choices, id: \Choice.text) { choice in
                NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                    Text(choice.text)
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(.black, in: Capsule())
                }

            }
            
        }
        .padding()
        .navigationTitle("Page \(pageIndex + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StoryPageView(story: StoryData.story, pageIndex: 0)
}
