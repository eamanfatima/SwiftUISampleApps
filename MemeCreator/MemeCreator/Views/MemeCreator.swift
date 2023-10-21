//
//  MemeCreator.swift
//  MemeCreator
//
//  Created by Eaman Fatima on 2023-10-18.
//

import SwiftUI

struct MemeCreator: View, Sendable {
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    
    @State private var memeText = ""
    @State private var fontSize: CGFloat = 60
    @State private var textColor = Color.white
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            LoadableImage(imageMetaData: fetcher.currentPanda)
                .onTapGesture {
                    isFocused = false
                }
                .overlay(alignment: .bottom) {
                    TextField(
                        "Meme Text",
                        text: $memeText,
                        prompt: Text(""))
                    .focused($isFocused)
                    .font(.system(size: fontSize, weight: .heavy))
                    .foregroundColor(textColor)
                    .shadow(radius: 10)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                .frame(minHeight: 150)
            Spacer()
            if !memeText.isEmpty {
                VStack {
                    HStack{
                       Text("Font Size")
                        Slider(value: $fontSize, in: 20...140)
                    }
                    HStack {
                        Text("Font Color")
                        ColorPicker("Color Picker", selection: $textColor)
                            .labelsHidden()
                            .frame(width: 124, height: 23, alignment: .leading)
                        Spacer()
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
            }
            HStack {
                Button(action: {
                    fetcher.currentPanda = fetcher.imageData.sample.randomElement() ?? Panda.defaultPanda
                }, label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Shuffle Photo")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                })
                .buttonStyle(.bordered)
                .controlSize(.large)
                Button(action: {
                    isFocused = true
                }, label: {
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Add Text")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                })
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, maxHeight: 180)
        }
        .padding()
        .task {
            try? await fetcher.fetchData()
        }
        .navigationTitle("Meme Creator")
    }
}

#Preview {
    NavigationStack {
        MemeCreator()
            .environmentObject(PandaCollectionFetcher())
    }
}
