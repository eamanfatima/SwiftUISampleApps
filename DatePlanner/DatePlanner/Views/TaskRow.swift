//
//  TaskRow.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-15.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: EventTask
    var isEditing: Bool
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                task.isCompleted.toggle()
            }, label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            })
            .buttonStyle(.plain)
            if isEditing || task.isNew {
                TextField("task Description", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { _, newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }
            } else {
                Text(task.text)
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .task {
            isFocused = task.isNew
        }
    }
}

#Preview {
    TaskRow(
        task: .constant(EventTask(text: "Do Something")),
        isEditing: false)
}
