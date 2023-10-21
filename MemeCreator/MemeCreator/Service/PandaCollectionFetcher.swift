//
//  PandaCollectionFetcher.swift
//  MemeCreator
//
//  Created by Eaman Fatima on 2023-10-18.
//

import Foundation

class PandaCollectionFetcher: ObservableObject {
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda
    
    var urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    func fetchData() async throws {
        guard let url = URL(string: urlString) else { return }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw FetchError.badRequest
        }
        Task { @MainActor in
            try imageData = JSONDecoder().decode(PandaCollection.self, from: data)
        }
    }
}
