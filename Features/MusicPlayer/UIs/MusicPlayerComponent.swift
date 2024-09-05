//
//  MusicPlayerComponent.swift
//  MusicPlayerUI
//
//  Created by Chang Woo Son on 3/10/24.
//

import SwiftUI

import MusicPlayerInterface
import MusicPlayerPresentation

import NeedleFoundation
import Domain

public protocol MusicPlayerDependency: Dependency {
    var useCaseBuilder: UseCaseBuilder { get }
}

public final class MusicPlayerComponent: Component<MusicPlayerDependency>, MusicPlayerBuilder {

    struct Component: MusicPlayerViewModelDependency {
    }


    @MainActor
    public func view() -> AnyView {
        AnyView(
            MusicPlayerScreen(
                viewModel: MusicPlayerViewModel(
                    dependency: Component(
                    )
                )
            )
        )
    }
}
