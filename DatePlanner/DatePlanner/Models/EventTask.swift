//
//  EventTask.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-13.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
