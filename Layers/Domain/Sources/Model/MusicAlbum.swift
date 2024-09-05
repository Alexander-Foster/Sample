//
//  MusicAlbum.swift
//  Domain
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation


public struct MusicAlbum {
    let id: String
    let artworkURL: URL?
    let title: String
    let artistName: String

    public init(id: String, artworkURL: URL?, title: String, artistName: String) {
        self.id = id
        self.artworkURL = artworkURL
        self.title = title
        self.artistName = artistName
    }
}
