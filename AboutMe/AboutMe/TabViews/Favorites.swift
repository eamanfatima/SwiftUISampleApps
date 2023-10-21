//
//  Favorites.swift
//  AboutMe
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        VStack {
            Text("My Favorites!")
                .font(.largeTitle)
            .bold()
            Text("Hobbies")
                .padding()
            HStack {
                ForEach(ContentPresenter.Favorites.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 60)
                        .padding()
                }
            }
            Text("Foods")
                .padding()
            HStack {
                ForEach(ContentPresenter.Favorites.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                        .padding()
                }
            }
        }
    }
}

#Preview {
    Favorites()
}
