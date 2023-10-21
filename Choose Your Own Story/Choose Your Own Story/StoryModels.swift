//
//  StoryModels.swift
//  Choose Your Own Story
//
//  Created by Eaman Fatima on 2023-10-09.
//

import Foundation

struct Story {
    let pages: [StoryPage]
    subscript(_ pageIndex: Int) -> StoryPage {
        pages[pageIndex]
    }
}

struct StoryPage {
    let text: String
    let choices: [Choice]
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let text: String
    let destination: Int
}
