//
//  MusicDataSourceImpl.swift
//  Remote
//
//  Created by Chang Woo Son on 5/4/24.
//

import Foundation
import MusicKit

import Data

actor MusicDataSourceImpl: MusicDataSource {
    private var albums: MusicItemCollection<Album> = .init([])

    nonisolated var isAuthorized: Bool {
        MusicAuthorization.currentStatus == .authorized
    }

    func requestAppleMusicAccess() async -> Bool {
        await MusicAuthorization.request() == .authorized
    }

    func fetchAllAlbums() async throws -> [MusicAlbumEntity] {
        let request = MusicLibraryRequest<Album>()
        let albums = try await request.response().items
        self.albums = albums
        return albums.map(\.entity)
    }
}
