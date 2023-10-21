//
//  StoryView.swift
//  AboutMe
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Text("My Story!")
                .font(.largeTitle)
            .bold()
            .padding()
            ScrollView {
                Text(ContentPresenter.Story.story)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .padding([.top, .bottom], 50)
    }
}

#Preview {
    StoryView()
}
