//
//  FailureOfDecoding.swift
//  CoreNetworkTests
//
//  Created by Chang Woo Son on 6/27/24.
//

import Foundation
@testable import CoreNetwork

actor FailureOfDecoding: APIDefinition {
    struct GetResponse: Decodable {
        let userId: Int
        let id: Int
        let title: Int
        let completed: Bool
    }

    nonisolated var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    typealias Parameter = EmptyParameter

    typealias Response = [GetResponse]

    nonisolated var method: HTTPMethod {
        .get
    }

    nonisolated var path: String {
        "/todos"
    }
}
