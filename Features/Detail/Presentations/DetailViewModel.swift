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
    var albumId: String { get }
    var getAlbumDetailUseCase: GetAlbumDetailUseCase { get }
}


public final class DetailViewModel: ObservableObject {

    @Published public private(set) var album: Album?
    @Published public private(set) var tracks: [Track] = []

    private let dependency: DetailViewModelDependency

    public init(dependency: DetailViewModelDependency) {
        self.dependency = dependency
    }

    public enum Action {
        case load
    }
}

// MARK: - Public function
public extension DetailViewModel {
    @MainActor
    func action(_ action: Action) {
        switch action {
        case .load:
            load()
        }
    }
}

// MARK: - Public variable
public extension DetailViewModel {
    var title: String {
        album?.title ?? ""
    }

    var albumId: String {
        album?.id ?? ""
    }
}

// MARK: - Private function
private extension DetailViewModel {
    @MainActor
    func load() {
        Task {
            do {
                guard let (album, tracks) = try await dependency.getAlbumDetailUseCase(with: dependency.albumId) else { return }
                self.album = album.presentation
                self.tracks = tracks.map(\.presentation)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func fetchAlbumTrack() -> [Track] {
        return []
    }
}
