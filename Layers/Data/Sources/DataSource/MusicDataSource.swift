//
//  MusicDataSource.swift
//  Data
//
//  Created by Chang Woo Son on 5/4/24.
//

import Foundation


public protocol MusicDataSource {
    var isAuthorized: Bool { get }
    func requestAppleMusicAccess() async -> Bool
    func fetchAllAlbums() async throws -> [MusicAlbumEntity]
}
