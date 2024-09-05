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
    var getAllAlbumUseCase: GetAllAlbumUseCase { get }
}


public final class MainViewModel: ObservableObject {

    @Published public private(set) var albums: [Album] = []

    private let dependency: MainViewModelDependency

    public init(dependency: MainViewModelDependency) {
        self.dependency = dependency
    }

    public enum Action {
        case load
    }
}

// MARK: - Public function
public extension MainViewModel {
    @MainActor
    func action(_ action: Action) {
        switch action {
        case .load:
            fetchAlbums()
        }
    }
}

// MARK: - Public variable
public extension MainViewModel {

}

// MARK: - Private function
private extension MainViewModel {
    @MainActor
    func fetchAlbums() {
        Task {
            do {
                self.albums = try await dependency.getAllAlbumUseCase()?.map(\.presentation) ?? []
            } catch {
                print(error)
            }
        }
    }
}
