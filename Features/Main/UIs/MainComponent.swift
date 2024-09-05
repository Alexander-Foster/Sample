//
//  MainComponent.swift
//  MainUI
//
//  Created by Chang Woo Son on 3/10/24.
//

import SwiftUI

import MainInterface
import MainPresentation
import DetailInterface

import NeedleFoundation
import Domain

public protocol MainDependency: Dependency {
    var useCaseBuilder: UseCaseBuilder { get }
    var detailBuilder: DetailBuilder { get }
}

public final class MainComponent: Component<MainDependency>, MainBuilder {

    struct Component: MainViewModelDependency {
        var getAllAlbumUseCase: GetAllAlbumUseCase
    }

    @MainActor
    public func view() -> AnyView {
        AnyView(
            MainScreen(
                viewModel: MainViewModel(
                    dependency: Component(
                        getAllAlbumUseCase: dependency.useCaseBuilder.getAllAlbumUseCase
                    )
                ),
                detailBuilder: dependency.detailBuilder
            )
        )
    }
}
