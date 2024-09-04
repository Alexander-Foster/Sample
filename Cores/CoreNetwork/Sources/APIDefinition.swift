//
//  APIDefinition.swift
//  Network
//
//  Created by Chang Woo Son on 6/20/24.
//

import Foundation
import OSLog

public protocol APIDefinition {
    associatedtype Parameter: Encodable
    associatedtype Response: Decodable

    // MARK: - Required
    var parameters: Parameter? { get }
    var method: HTTPMethod { get }
    var path: String { get }


    // MARK: - Optional
    var baseURL: URL { get }
    var contentType: ContentType { get }
    var decoder: JSONDecoder { get }
    var headers: HTTPHeaders { get }
}

extension APIDefinition where Parameter == EmptyParameter {
    var parameters: Parameter? { nil }
}

public extension APIDefinition {
    var baseURL: URL { API.configure.baseURL }
    var contentType: ContentType { .json }

    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }

    var headers: HTTPHeaders {
        var defaultHeaders = HTTPHeaders.default
        defaultHeaders.add(.contentType("\(contentType.rawValue); charset=UTF-8"))
        return defaultHeaders
    }

    @discardableResult
//    func request() async throws(NetworkError) -> Self.Response {
    func request() async throws -> Self.Response {
        do {
            let request = asURLRequest()

            willSendLog(request)

            let (data, response) = try await send(for: request)

            guard let httpURLResponse = response as? HTTPURLResponse else {
                throw NetworkError.nonHTTPResponse(response)
            }

            let networkResponse = CoreNetwork.Response(
                statusCode: httpURLResponse.statusCode,
                data: data,
                request: request,
                response: httpURLResponse
            )

            guard (200..<300).contains(httpURLResponse.statusCode) else {
                throw NetworkError.statusCode(networkResponse)
            }

            responseLog(networkResponse, isError: false)

            let jsonObject = try mapJSON(data: data, networkResponse: networkResponse)
            let serialize = try serializeToData(jsonObject, networkResponse: networkResponse)
            return try checkDecoding(data: serialize, response: networkResponse)
        } catch let error as NetworkError {
            errorLog(error)
            throw error
        } catch {
            throw NetworkError.undifined
        }
    }
}


private extension APIDefinition {
    var url: URL {
        baseURL.appendingPathComponent(path)
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter
    }

    func asURLRequest() -> URLRequest {
        var httpBody: Data?
        var targetURL = url

        switch method {
        case .get:
            parameters?.dictionary?.forEach { targetURL.appendQueryItem(name: $0.key, value: $0.value)
            }

        case .post:
            httpBody = try? JSONEncoder().encode(parameters)
        default:
            break
        }

        var urlRequest = URLRequest(url: targetURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers.dictionary
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        urlRequest.httpBody = httpBody
        return urlRequest
    }

//    func send(for request: URLRequest) async throws(NetworkError) -> (Data, URLResponse) {
    func send(for request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.underlying(error, nil)
        }
    }

//    func checkDecoding(data: Data, response: CoreNetwork.Response) throws(NetworkError) -> Self.Response {
    func checkDecoding(data: Data, response: CoreNetwork.Response) throws -> Self.Response {
        do {
            return try decoder.decode(Self.Response.self, from: data)
        } catch {
            let networkError = NetworkError.objectMapping(error, response)
#if DEBUG
            if #available(iOS 14.0, *) {
                Logger.API.debug("=========ErrorLogging: start - decodeFail ===========")
                Logger.API.debug("\(networkError.errorUserInfo, privacy: .auto)")
                Logger.API.debug("=========ErrorLogging: end - decodeFail ===========")
            }
#endif
            throw networkError
        }
    }

//    func serializeToData(_ jsonObject: Any, networkResponse: CoreNetwork.Response) throws(NetworkError) -> Data {
    func serializeToData(_ jsonObject: Any, networkResponse: CoreNetwork.Response) throws -> Data {
        guard JSONSerialization.isValidJSONObject(jsonObject) else {
            throw NetworkError.jsonMapping(networkResponse)
        }
        do {
            return try JSONSerialization.data(withJSONObject: jsonObject)
        } catch {
            throw NetworkError.jsonMapping(networkResponse)
        }
    }

//    func mapJSON(failsOnEmptyData: Bool = true, data: Data, networkResponse: CoreNetwork.Response) throws(NetworkError) -> Any {
    func mapJSON(failsOnEmptyData: Bool = true, data: Data, networkResponse: CoreNetwork.Response) throws -> Any {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        } catch {
            if data.isEmpty && !failsOnEmptyData {
                return NSNull()
            }
            throw NetworkError.jsonMapping(networkResponse)
        }
    }

    func responseLog(_ response: CoreNetwork.Response, isError: Bool) {
#if DEBUG
        if #available(iOS 14.0, *) {
            let request = response.request
            let url: String = request?.url?.absoluteString ?? "nil"
            let statusCode: Int = response.statusCode

            var log: String = isError ? "💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣" : "💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌"
            log.append("\n\n\(statusCode) \(url)\n")
            response.response?.allHeaderFields.forEach {
                log.append("\($0): \($1)\n")
            }
            if let reString = String(bytes: response.data, encoding: String.Encoding.utf8) {
                log.append("\(reString)\n")
            }
            log.append("END HTTP (\(response.data.count)-byte body)\n\n")
            log.append(isError ? "💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣" : "💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌💌")
            Logger.API.info("\(log, privacy: .auto)")
        }
#endif
    }

    /// API를 보내기 직전에 호출
    func willSendLog(_ request: URLRequest) {
#if DEBUG
        if #available(iOS 14.0, *) {
            let url: String = request.url?.absoluteString ?? ""
            let method: String = request.httpMethod ?? "unknown method"

            var log: String = "🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀"
            log.append("\n\n\(method) \(url)\n")
            if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
                log.append("header: \(headers)\n")
            }
            if let cookies = HTTPCookieStorage.shared.cookies {
                log.append("cookies: \(cookies)\n")
            }
            if let body = request.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
                log.append("\(bodyString)\n")
            }
            log.append("END \(method)\n\n")
            log.append("🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀")
            Logger.API.debug("\(log, privacy: .auto)")
        }
#endif
    }

    func errorLog(_ error: NetworkError) {
#if DEBUG
        if let response = error.response {
            responseLog(response, isError: true)
            return
        }

        if #available(iOS 14.0, *) {
            var log: String = "💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣"
            log.append("\n\n\(error.errorCode)\n")
            log.append("\(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
            log.append("END HTTP\n\n")
            log.append("💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣💣")
            Logger.API.debug("\(log, privacy: .auto)")
        }
#endif
    }
}

extension URL {
    mutating func appendQueryItem(name: String, value: Any) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: name, value: String(describing: value))
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        self = urlComponents.url!
    }
}
