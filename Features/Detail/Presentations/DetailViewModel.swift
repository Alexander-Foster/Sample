//
//  DetailViewModel.swift
//  DetailPresentation
//
//  Created by Chang Woo Son on 3/14/24.
//

import Foundation
import Combine

import Domain

public protocol DetailViewModelDependency {
}


public final class DetailViewModel: ObservableObject {

    private let dependency: DetailViewModelDependency

    public init(dependency: DetailViewModelDependency) {
        self.dependency = dependency
    }

    public enum Action {

    }
}

// MARK: - Public function
public extension DetailViewModel {
    @MainActor
    func action(_ action: Action) {
        switch action {

        }
    }
}

// MARK: - Public variable
public extension DetailViewModel {

}

// MARK: - Private function
private extension DetailViewModel {

}
