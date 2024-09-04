//
//  MainViewModel.swift
//  MainPresentation
//
//  Created by Chang Woo Son on 3/14/24.
//

import Foundation
import Combine

import Domain

public protocol MainViewModelDependency {

}


public final class MainViewModel: ObservableObject {

    private let dependency: MainViewModelDependency

    public init(dependency: MainViewModelDependency) {
        self.dependency = dependency
    }

    public enum Action {

    }
}

// MARK: - Public function
public extension MainViewModel {
    @MainActor
    func action(_ action: Action) {
        switch action {
        }
    }
}

// MARK: - Public variable
public extension MainViewModel {

}

// MARK: - Private function
private extension MainViewModel {
    
}
