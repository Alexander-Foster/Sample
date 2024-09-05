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

    }


    @MainActor
    public func view() -> AnyView {
        AnyView(
            DetailScreen(
                viewModel: DetailViewModel(
                    dependency: Component(

                    )
                )
            )
        )
    }
}
