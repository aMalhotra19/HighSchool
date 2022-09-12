//
//  ServiceManager.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation
import NetworkService
/// ApiService Protocol to sere as a contract for school and score data
///
/// ```fetchScore ```
/// > Connects with networkService and fetches sat score for a given dbn value
///
/// ```fetchSchool```
/// > Connects with networkService and fetches high school data
///
///
/// - Parameters:
///     - networkService: The networkService object of Network module
///
protocol ApiService {
    func fetchScore(from urlString: String, for schoolWithDBN: String) async throws -> [SatScore]?
    func fetchSchool(from urlString: String) async throws -> [HighSchool]?
}

final class ServiceManager: ApiService {
    let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    /// Connects with networkService and fetches high school data
    /// updates the query param based on dbn
    ///
    ///
    /// - Parameters:
    ///     - urlString: Url string to fetch data from
    /// - Returns:
    ///     - [SatScore]: array of Model object for SAT Scores
    func fetchScore(from urlString: String, for schoolWithDBN: String) async throws -> [SatScore]? {

        let queryItems = [URLQueryItem(name: Constants.dbn, value: schoolWithDBN)]
        var urlComps = URLComponents(string: urlString)!
        urlComps.queryItems = queryItems
        guard let url = urlComps.url else {
            fatalError()
        }

        let data = try? await networkService.fetch(from: url)
        if let data = data {
            let modelObject = try? JSONDecoder().decode([SatScore].self, from: data)
            return modelObject
        }
        return []
    }
    
    /// Connects with networkService and fetches high school data
    ///
    ///
    /// - Parameters:
    ///     - urlString: Url string to fetch data from
    /// - Returns:
    ///     - [HighSchool]: array of highschool data
    func fetchSchool(from urlString: String) async throws -> [HighSchool]? {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        let data = try? await networkService.fetch(from: url)
        if let data = data {
            let modelObject = try? JSONDecoder().decode([HighSchool].self, from: data)
            return modelObject
        }
        return []
    }
}
