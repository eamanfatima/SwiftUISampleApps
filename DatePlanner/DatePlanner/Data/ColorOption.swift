//
//  ColorOption.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-13.
//

import SwiftUI

struct ColorOption {
    static var all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
    ]
    
    static var `default` = Color.primary
    
    static func random() -> Color {
        all.randomElement() ?? .primary
    }
}
