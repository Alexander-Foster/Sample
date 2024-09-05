//
//  MusicPlayerViewModel.swift
//  DetailPresentation
//
//  Created by Chang Woo Son on 3/14/24.
//

import Foundation
import Combine

import Domain

public protocol MusicPlayerViewModelDependency {

}


public final class MusicPlayerViewModel: ObservableObject {


    private let dependency: MusicPlayerViewModelDependency

    public init(dependency: MusicPlayerViewModelDependency) {
        self.dependency = dependency
    }

    public enum Action {

    }
}

// MARK: - Public function
public extension MusicPlayerViewModel {
    @MainActor
    func action(_ action: Action) {
        switch action {
            
        }
    }
}

// MARK: - Public variable
public extension MusicPlayerViewModel {

}

// MARK: - Private function
private extension MusicPlayerViewModel {

}
