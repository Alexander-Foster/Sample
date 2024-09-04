//
//  PostRequest.swift
//  CoreNetworkTests
//
//  Created by Chang Woo Son on 6/28/24.
//

import Foundation
@testable import CoreNetwork

actor PostRequest: APIDefinition {
    let parameters: PostParameter?
    
    struct PostResponse: Decodable {
        let id: Int
        let title: String
        let body: String
        let userId: Int
    }

    struct PostParameter: Encodable {
        let title: String
        let body: String
        let userId: Int
    }

    nonisolated var baseURL: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }

    typealias Parameter = PostParameter

    typealias Response = PostResponse

    nonisolated var method: HTTPMethod {
        .post
    }

    nonisolated var path: String {
        "/posts"
    }

    init(title: String, body: String, userId: Int) {
        self.parameters = PostParameter(
            title: title, body: body, userId: userId
        )
    }
}
