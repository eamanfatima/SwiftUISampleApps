//
//  TaskDetail.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-15.
//

import SwiftUI

struct EventDetail: View {
    @Binding var event: Event
    var isEditing: Bool
    @State var isPickingSymbol = false
    
    var body: some View {
        List {
            HStack {
                Button(action: {
                    isPickingSymbol.toggle()
                }, label: {
                    Image(systemName: event.symbol)
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                        .foregroundColor(event.color)
                        .opacity(isEditing ? 0.3 : 1)
                })
                .buttonStyle(.plain)
                .padding(.horizontal, 5)
                if isEditing {
                    TextField("New Event", text: $event.title)
                        .font(.title2)
                        .disableAutocorrection(true)
                } else {
                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            if isEditing {
                DatePicker("Date", selection: $event.date)
                    .labelsHidden()
                    .listRowSeparator(.hidden)
            } else {
                HStack {
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                }
                .listRowSeparator(.hidden)
            }
            Text("Tasks")
                .fontWeight(.bold)
            ForEach($event.tasks) { task in
                TaskRow(task: task, isEditing: isEditing)
            }
            .onDelete(perform: { indexSet in
                event.tasks.remove(atOffsets: indexSet)
            })
            Button(action: {
                event.tasks.append(EventTask(text: "", isNew: true))
            }, label: {
                Label("Add Task", systemImage: "plus")
            })
            .buttonStyle(.borderless)
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isPickingSymbol, content: {
            SymbolPicker(event: $event)
        })
    }
}

#Preview {
        EventDetail(
        event: .constant(EventData().events[0]),
        isEditing: true)
}
