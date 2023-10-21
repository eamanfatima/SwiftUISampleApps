//
//  Panda.swift
//  MemeCreator
//
//  Created by Eaman Fatima on 2023-10-18.
//

import Foundation
import SwiftUI

struct Panda: Codable {
    var description: String
    var imageUrl: URL?
    
    static let defaultPanda = Panda(
        description: "Cute Panda",
        imageUrl: URL(string: "https://playgrounds-cdn.apple.com/assets/pandas/pandaHungry.jpg"))
}

struct PandaCollection: Codable {
    var sample: [Panda]
}
