//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Evgenii Goloven on 4/24/21.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) {
            phase in
            switch phase {
            case .background:
                //offload LoadingResponses
                RemoteImageLoader.cache.offload()
            default:
                print("")
            }
        }
    }
}
