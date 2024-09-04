//
//  PutRequest.swift
//  CoreNetworkTests
//
//  Created by Chang Woo Son on 6/28/24.
//

import Foundation
@testable import CoreNetwork

actor PutRequest: APIDefinition {
    let parameters: PutParameter?

    struct PutResponse: Decodable {
        let id: Int
    }

    struct PutParameter: Encodable {
        let id: Int
        let title: String
        let body: String
        let userId: Int
    }

    nonisolated var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    typealias Parameter = PutParameter

    typealias Response = PutResponse

    nonisolated var method: HTTPMethod {
        .put
    }

    nonisolated var path: String {
        "/posts/1"
    }

    init(id: Int, title: String, body: String, userId: Int) {
        self.parameters = PutParameter(
            id: id,
            title: title,
            body: body,
            userId: userId
        )
    }
}
