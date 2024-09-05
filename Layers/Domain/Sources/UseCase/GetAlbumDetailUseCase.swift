//
//  GetAlbumDetailUseCase.swift
//  Domain
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation


public actor GetAlbumDetailUseCase {

    private let repository: MusicRepository

    init(
        repository: MusicRepository
    ) {
        self.repository = repository
    }

    public func callAsFunction(with id: String) async -> (MusicAlbum, [MusicTrack])? {
        await repository.albumDetail(by: id)
    }
}
