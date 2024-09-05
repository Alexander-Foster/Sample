//
//  MusicTrack.swift
//  Domain
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation


public struct MusicTrack {
    public let id: String
    public let number: Int?
    public let title: String

    public init(id: String, number: Int?, title: String) {
        self.id = id
        self.number = number
        self.title = title
    }
}
