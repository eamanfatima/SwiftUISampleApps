//
//  HomeView.swift
//  AboutMe
//
//  Created by Eaman Fatima on 2023-10-09.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("About Me!")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            .bold()
            .padding()
            Image(ContentPresenter.Home.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.quaternary, lineWidth: 4))
                .shadow(radius: 10)
                .padding(.init(top: 40, leading: 40, bottom: 10, trailing: 40))
            Text(ContentPresenter.Home.name)
                .font(.caption)
                .fontWeight(.medium)

        }
    }
}

#Preview {
    HomeView()
}
