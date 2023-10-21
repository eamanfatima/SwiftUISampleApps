//
//  DatePlannerApp.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-13.
//

import SwiftUI

@main
struct DatePlannerApp: App {
    @StateObject private var eventData = EventData()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EventList()
            }
            .environmentObject(eventData)
        }
    }
}
