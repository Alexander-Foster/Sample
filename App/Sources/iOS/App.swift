//
//  App.swift
//  Delight Room
//
//  Created by Chang Woo Son on 8/3/24.
//

import SwiftUI

import MusicPlayControl
import NeedleFoundation


@main
struct MainApp: App {
    @StateObject var playerManager = MusicPlayerManager()

    let rootComponent: RootComponent

    init() {
        registerProviderFactories()
        rootComponent = RootComponent()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                rootComponent.rootView

                VStack {
                    Spacer()
                    rootComponent.featureBuilder.musicPlayerBuilder.view()
                }
            }
            .environmentObject(playerManager)
        }
    }
}
