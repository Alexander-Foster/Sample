//
//  DeleteRequest.swift
//  CoreNetworkTests
//
//  Created by Chang Woo Son on 6/28/24.
//

import Foundation
@testable import CoreNetwork

actor DeleteRequest: APIDefinition {
    nonisolated var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    typealias Parameter = EmptyParameter

    typealias Response = EmptyResponse

    nonisolated var method: HTTPMethod {
        .delete
    }

    nonisolated var path: String {
        "/posts/1"
    }
}
