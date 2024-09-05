//
//  GetAllAlbumUseCase.swift
//  Domain
//
//  Created by Chang Woo Son on 7/15/24.
//

import Foundation

public actor GetAllAlbumUseCase {

    private let repository: MusicRepository

    init(
        repository: MusicRepository
    ) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> [MusicAlbum]? {
        guard await repository.requestAppleMusicAccess() else { return nil }
        return try await repository.fetchAllAlbums()
    }
}

