//
//  LoadableImage.swift
//  MemeCreator
//
//  Created by Eaman Fatima on 2023-10-18.
//

import SwiftUI

struct LoadableImage: View {
    
    var imageMetaData: Panda
    
    var body: some View {
        AsyncImage(url: imageMetaData.imageUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .accessibilityHidden(false)
                    .accessibilityLabel(Text(imageMetaData.description))
            case .failure(_):
                VStack {
                    Image(.pandaplaceholder)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("Pandas were all busy")
                        .font(.title2)
                    Text("Please try again")
                        .font(.title3)
                }
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    LoadableImage(imageMetaData: Panda.defaultPanda)
}
