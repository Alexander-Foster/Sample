//
//  MusicRepository.swift
//  Domain
//
//  Created by Chang Woo Son on 5/4/24.
//

import Foundation


public protocol MusicRepository {
    func requestAppleMusicAccess() async -> Bool
    func fetchAllAlbums() async throws -> [MusicAlbum]
    func albumDetail(by id: String) async throws -> (MusicAlbum, [MusicTrack])?
}
