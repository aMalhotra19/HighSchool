//
//  DataManager.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation

/// Shared DataManager class to manage data for the views and bridge between service and data layer
///
/// ```loadSatScore(for: ) ```
///  Loads sat score for a given dbn value
///
/// ```loadHighSchoolData( ) ```
///  Loads high school data
///
///
/// - Parameters:
///     - serviceManager: The service manager object
///
/// - Returns: DataManger `shared`object.
class DataManager {
    
    static let shared = DataManager(serviceManager: ServiceManager())
    let serviceManager: ServiceManager
    init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
    
    func loadSatScore(for schoolWithDBN: String) async throws -> [SatScore]? {
        return try? await serviceManager.fetchScore(from: Constants.urlSatResult, for: schoolWithDBN)
    }
    
    func loadHighSchoolData() async throws -> [HighSchool]? {
        return try? await serviceManager.fetchSchool(from: Constants.urlHighSchool)
    }
}
