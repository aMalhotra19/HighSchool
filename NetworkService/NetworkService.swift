//
//  NetworkService.swift
//  NetworkService
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation

public protocol HTTPClient {
    func fetch(from url: URL) async throws -> Data?
}
/// NetworkService to make api calls and returns Data
///
/// ```fetch(from: ) ```
///  Fetches data from the given url
///
/// - Parameters:
///     - url: URL
///
/// - Returns: Data?
public final class NetworkService: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func fetch(from url: URL) async throws -> Data? {
        let (data, _) = try await session.data(from: url)
        return data
    }
}
