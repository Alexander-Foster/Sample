//
//  Track.swift
//  DetailInterface
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation

import Domain

public struct Track: Identifiable {
    public let id: String
    public let number: Int?
    public let title: String
}


public extension MusicTrack {
    var presentation: Track {
        .init(id: id, number: number, title: title)
    }
}
