//
//  Album.swift
//  MainInterface
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation

import Domain

public struct Album {
    public let id: String
    public let artworkURL: URL?
    public let title: String
    public let artistName: String
}


public extension MusicAlbum {
    var presentation: Album {
        .init(id: id, artworkURL: artworkURL, title: title, artistName: artistName)
    }
}
