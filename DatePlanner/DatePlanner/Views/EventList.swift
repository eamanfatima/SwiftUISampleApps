//
//  EventList.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-16.
//

import SwiftUI

struct EventList: View {
    @EnvironmentObject var eventData: EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    @State var searchTerm = ""
    
    var body: some View {
        VStack {
            Text("abc")
            List {
                ForEach(Period.allCases) { period in
                    if !eventData.sortedEvents(period, searchItem: searchTerm).isEmpty {
                        Section {
                            ForEach(eventData.sortedEvents(period, searchItem: searchTerm)) { $event in
                                NavigationLink {
                                    EventEditor(event: $event)
                                } label: {
                                    EventRow(event: event)
                                }
                                .swipeActions(allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        eventData.delete(event)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }

                                }
                            }
                        } header: {
                            Text(period.name)
                                .font(.callout)
                                .foregroundColor(.secondary)
                                .fontWeight(.bold)
                        }

                    }
                }
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Date Planner")
            .toolbar {
                ToolbarItem {
                    Button {
                        newEvent = Event()
                        isAddingNewEvent = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $isAddingNewEvent) {
                NavigationStack {
                    EventEditor(event: $newEvent, isNew: true)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EventList()
    }
    .environmentObject(EventData())
}
