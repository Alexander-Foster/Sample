//
//  DetailComponent.swift
//  DetailUI
//
//  Created by Chang Woo Son on 3/10/24.
//

import SwiftUI

import DetailInterface
import DetailPresentation

import NeedleFoundation
import Domain

public protocol DetailDependency: Dependency {
    var useCaseBuilder: UseCaseBuilder { get }
}

public final class DetailComponent: Component<DetailDependency>, DetailBuilder {

    struct Component: DetailViewModelDependency {
        var albumId: String
        var getAlbumDetailUseCase: GetAlbumDetailUseCase
    }


    @MainActor
    public func view(albumId: String) -> AnyView {
        AnyView(
            DetailScreen(
                viewModel: DetailViewModel(
                    dependency: Component(
                        albumId: albumId,
                        getAlbumDetailUseCase: dependency.useCaseBuilder.getAlbumDetailUseCase
                    )
                )
            )
        )
    }
}
