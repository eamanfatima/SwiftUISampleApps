//
//  EventRow.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-15.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(systemName: event.symbol)
                .imageScale(.large)
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(event.color)
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .fontWeight(.bold)
                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
        }
        .badge(event.remainingTaskCount)
    }
}

#Preview {
    EventRow(event: EventData().events[0])
}
