//
//  RepositoryImpl.swift
//  Data
//
//  Created by Chang Woo Son on 5/4/24.
//

import Foundation

import Domain

struct RepositoryImpl: Repository {


    private let dataSource: MusicDataSource

    init(dataSource: MusicDataSource) {
        self.dataSource = dataSource
    }
}
