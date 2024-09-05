//
//  RepositoryBuilder.swift
//  Domain
//
//  Created by Chang Woo Son on 5/3/24.
//

import Foundation


public protocol RepositoryBuilder {
    var musicRepository: MusicRepository { get }
}
