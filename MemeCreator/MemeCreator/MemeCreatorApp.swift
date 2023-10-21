//
//  MemeCreatorApp.swift
//  MemeCreator
//
//  Created by Eaman Fatima on 2023-10-18.
//

import SwiftUI

@main
struct MemeCreatorApp: App {
    @StateObject var dataFetcher = PandaCollectionFetcher()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MemeCreator()
                    .environmentObject(dataFetcher)
            }
        }
    }
}
