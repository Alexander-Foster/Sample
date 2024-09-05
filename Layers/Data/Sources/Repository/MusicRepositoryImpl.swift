//
//  MusicRepositoryImpl.swift
//  Data
//
//  Created by Chang Woo Son on 5/4/24.
//

import Foundation

import Domain

actor MusicRepositoryImpl: MusicRepository {

    private let dataSource: MusicDataSource

    init(dataSource: MusicDataSource) {
        self.dataSource = dataSource
    }

    func requestAppleMusicAccess() async -> Bool {
        guard !dataSource.isAuthorized else { return true }
        return await dataSource.requestAppleMusicAccess()
    }

    func fetchAllAlbums() async throws -> [MusicAlbum] {
        try await dataSource.fetchAllAlbums().map(\.domain)
    }
}
