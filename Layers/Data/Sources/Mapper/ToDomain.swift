//
//  ToDomain.swift
//  Data
//
//  Created by Chang Woo Son on 7/14/24.
//

import Foundation

import Domain


extension MusicAlbumEntity {
    var domain: MusicAlbum {
        .init(id: id, artworkURL: artworkURL, title: title, artistName: artistName)
    }
}
