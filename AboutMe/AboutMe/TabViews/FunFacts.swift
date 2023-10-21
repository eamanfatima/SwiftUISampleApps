//
//  FunFacts.swift
//  AboutMe
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct FunFacts: View {
    @State private var funFact = ""
    var body: some View {
        VStack {
            Text("Fun Facts about me!")
                .font(.largeTitle)
            .bold()
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            Button("Random Fact") {
                funFact = ContentPresenter.FunFacts.funFacts.randomElement()!
            }
            .foregroundColor(.white)
            .bold()
            .padding()
            .background(.black, in: Capsule())
            .shadow(radius: 10)
            .padding()
        }
    }
}

#Preview {
    FunFacts()
}
