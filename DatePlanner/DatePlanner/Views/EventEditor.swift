//
//  EventEditor.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-16.
//

import SwiftUI

struct EventEditor: View {
    @Binding var event: Event
    var isNew = false
    
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventCopy = Event()
    @State private var isEditing = false
    
    @State private var isDeleted = false
    
    private var isEventDeleted: Bool {
        !eventData.contains(event) && !isNew
    }
    
    var body: some View {
        VStack {
            EventDetail(
                event: $eventCopy,
                isEditing: isNew ? true : isEditing)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    if isNew {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
                ToolbarItem {
                    Button(action: {
                        if isNew {
                            eventData.add(eventCopy)
                            dismiss()
                        } else {
                            if isEditing && !isDeleted {
                                print("Done saving changes to \(event.title)")
                                withAnimation {
                                    event = eventCopy
                                }
                            }
                            isEditing.toggle()
                        }
                    }, label: {
                        Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
                    })
                }
            }
            .onAppear {
                eventCopy = event
            }
            .disabled(isEventDeleted)
            
            if isEditing && !isNew {
                Button(
                    role: .destructive) {
                        isDeleted = true
                        dismiss()
                        eventData.delete(event)
                    } label: {
                        Label("Delete Event", systemImage: "trash.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    .padding()

            }
        }
        .overlay(alignment: .center) {
            if isEventDeleted {
                Color(UIColor.systemBackground)
                Text("Event Deleted. Select an Event.")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    EventEditor(event: .constant(EventData().events[0]))
        .environmentObject(EventData())
}
