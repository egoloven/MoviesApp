//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    let persistenceController = PersistenceController.shared

    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) {
            phase in
            switch phase {
            case .background:
                RemoteImageLoader.cache.offload()
            default:
                print("")
            }
        }
    }
}
