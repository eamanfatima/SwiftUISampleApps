//
//  Event.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-13.
//

import Foundation


struct Event: Identifiable, Hashable {
    var id = UUID()
    var symbol = EventSymbols.randomName()
    var color = ColorOption.random()
    var title = ""
    var tasks = [EventTask(text: "")]
    var date = Date()
    
    var remainingTaskCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var isComplete: Bool {
        tasks.allSatisfy { $0.isCompleted }
    }
    
    var isPast: Bool {
        date < .now
    }
    
    var isWithinSevenDays: Bool {
        !isPast && (date < .now.sevenDaysOut)
    }
    
    var isWithinSevenToThirtyDays: Bool {
        !isPast && !isWithinSevenDays && (date < .now.thirtyDaysOut)
    }
    
    var isDistant: Bool {
        date >= .now.thirtyDaysOut
    }
}

extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}
