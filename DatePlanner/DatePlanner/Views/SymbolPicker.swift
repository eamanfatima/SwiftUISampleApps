//
//  SymbolPicker.swift
//  DatePlanner
//
//  Created by Eaman Fatima on 2023-10-16.
//

import SwiftUI

struct SymbolPicker: View {
    
    @Binding var event: Event
    @Environment(\.dismiss) private var dismiss
    @State private var selectedColor: Color = ColorOption.default
    @State private var symbolNames = EventSymbols.symbolNames
    
    var columns = Array(
        repeating: GridItem(.flexible()),
        count: 6)
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
               dismiss()
            }, label: {
                Text("Done")
            })
            .padding()
        }
        HStack {
            Image(systemName: event.symbol)
                .imageScale(.large)
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(selectedColor)
                .padding()
        }
        HStack {
            ForEach(ColorOption.all, id: \.self) { color in
                Button(action: {
                    selectedColor = color
                    event.color = color
                }, label: {
                    Circle()
                        .foregroundColor(color)
                })
            }
        }
        .padding(.horizontal)
        .frame(height: 40)
        ScrollView {
            LazyVGrid(
                columns: columns,
                content: {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button(action: {
                            event.symbol = symbolItem
                        }, label: {
                            Image(systemName: symbolItem)
                                .imageScale(.large)
                                .symbolRenderingMode(.monochrome)
                                .foregroundStyle(selectedColor)
                                .padding(5)
                        })
                        .buttonStyle(.plain)
                    }
            })
            .drawingGroup()
        }
        .onAppear {
            selectedColor = event.color
        }
    }
}

#Preview {
    SymbolPicker(event: .constant(EventData().events[0]))
}
