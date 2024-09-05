//
//  MusicDataSourceImpl.swift
//  Remote
//
//  Created by Chang Woo Son on 5/4/24.
//

import Foundation
import MusicKit

import Data

struct MusicDataSourceImpl: MusicDataSource {
    var isAuthorized: Bool {
        MusicAuthorization.currentStatus == .authorized
    }

    func requestAppleMusicAccess() async -> Bool {
        await MusicAuthorization.request() == .authorized
    }

    func fetchAllAlbums() async throws -> [MusicAlbumEntity] {
        let request = MusicLibraryRequest<Album>()
        return try await request.response().items.map(\.entity)
    }
}
