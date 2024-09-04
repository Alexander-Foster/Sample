//
//  App.swift
//  Delight Room
//
//  Created by Chang Woo Son on 8/3/24.
//

import SwiftUI

import NeedleFoundation


@main
struct MainApp: App {

    let rootComponent: RootComponent

    init() {
        registerProviderFactories()
        rootComponent = RootComponent()
    }

    var body: some Scene {
        WindowGroup {
            rootComponent.rootView
        }
    }
}
