//
//  PatchRequest.swift
//  CoreNetworkTests
//
//  Created by Chang Woo Son on 6/28/24.
//

import Foundation
@testable import CoreNetwork

actor PatchRequest: APIDefinition {
    let parameters: PatchParameter?

    struct PatchResponse: Decodable {
        let id: Int
        let title: String
        let body: String
        let userId: Int
    }

    struct PatchParameter: Encodable {
        let title: String
    }

    nonisolated var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    typealias Parameter = PatchParameter

    typealias Response = PatchResponse

    nonisolated var method: HTTPMethod {
        .patch
    }

    nonisolated var path: String {
        "/posts/1"
    }

    init(title: String) {
        self.parameters = PatchParameter(title: title)
    }
}
