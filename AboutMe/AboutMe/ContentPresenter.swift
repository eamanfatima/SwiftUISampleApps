//
//  Data.swift
//  AboutMe
//
//  Created by Eaman Fatima on 2023-10-09.
//

import Foundation
import SwiftUI

struct ContentPresenter {
    struct Home {
        static let name = "Eaman Fatima"
        static let image: ImageResource = .profile
    }
    struct Story {
        static let story = "I am an iOS Engineer trying to learn SwiftUI best practices. I have taken some time off from work to relax and catch up with the latest iOS updates.\n\nI am planning to go to Whistler at the end of December with Omar, to spend some quality time together, far away from all the worries and find happiness."
    }
    struct Favorites {
        static let hobbies = ["bicycle", "ticket.fill", "book.fill"]
        static let foods = ["🥐", "🌮", "🍣"]
    }
    struct FunFacts {
        static let funFacts = [
            "The femur is the longest and largest bone in the human body.",
            "The moon is 238,900 miles away.",
            "Prince’s last name was Nelson.",
            "503 new species were discovered in 2020.",
            "Ice is 9 percent less dense than liquid water.",
            "You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐",
            "A collection of hippos is called a bloat.",
            "White sand beaches are made of parrotfish poop.",
        ]
    }
}
