//
//  ToEntity.swift
//  Remote
//
//  Created by Chang Woo Son on 7/14/24.
//

import Foundation
import MusicKit

import Data


extension Album {
    var entity: MusicAlbumEntity {
        .init(
            id: id.rawValue,
            artworkURL: artwork?.url(width: 500, height: 500),
            title: title,
            artistName: artistName
        )
    }
}

extension Track {
    var entity: MusicTrackEntity {
        .init(
            id: id.rawValue,
            number: trackNumber,
            title: title
        )
    }
}
