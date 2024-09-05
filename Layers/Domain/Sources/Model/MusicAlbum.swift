//
//  MusicAlbum.swift
//  Domain
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation


public struct MusicAlbum {
    public let id: String
    public let artworkURL: URL?
    public let title: String
    public let artistName: String

    public init(id: String, artworkURL: URL?, title: String, artistName: String) {
        self.id = id
        self.artworkURL = artworkURL
        self.title = title
        self.artistName = artistName
    }
}
