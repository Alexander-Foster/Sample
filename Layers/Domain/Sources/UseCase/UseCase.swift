//
//  UseCase.swift
//  Domain
//
//  Created by Chang Woo Son on 7/15/24.
//

import Foundation

public struct UseCase {

    private let repository: Repository

    init(
        repository: Repository
    ) {
        self.repository = repository
    }

    public func callAsFunction(isbn13: String) async throws {
        
    }
}

