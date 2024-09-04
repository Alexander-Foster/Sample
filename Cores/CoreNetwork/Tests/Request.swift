//
//  Request.swift
//  CoreNetworkTests
//
//  Created by Chang Woo Son on 6/25/24.
//

import Foundation
import Testing
import XCTest
@testable import CoreNetwork



@Suite
struct Request {
    @Test
    func getRequestSuccess() async throws {
        let getResponseList = try await GetRequest().request()
        #expect(getResponseList.first?.id == 1)
    }

    @Test
    func postRequestSuccess() async throws {
        let response = try await PostRequest(title: "post request", body: "test", userId: 1).request()
        #expect(response.title == "post request")
        #expect(response.body == "test")
        #expect(response.userId == 1)
    }

    @Test
    func putRequestSuccess() async throws {
        let response = try await PutRequest(id: 1, title: "put request", body: "test", userId: 1).request()
        #expect(response.id == 1)
    }

    @Test
    func patchRequestSuccess() async throws {
        let response = try await PatchRequest(title: "patch test").request()
        #expect(response.id == 1)
    }

    @Test
    func deleteRequestSuccess() async throws {
        try await DeleteRequest().request()
    }

    @Test
    func getRequestFailureOfDecoding() async {
        await #expect(throws: NetworkError.self) {
            try await FailureOfDecoding().request()
        }
    }
}


