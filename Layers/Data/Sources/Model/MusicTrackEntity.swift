//
//  MusicTrackEntity.swift
//  Data
//
//  Created by Chang Woo Son on 9/5/24.
//

import Foundation


public struct MusicTrackEntity {
    let id: String
    let number: Int?
    let title: String

    public init(id: String, number: Int?, title: String) {
        self.id = id
        self.number = number
        self.title = title
    }
}
