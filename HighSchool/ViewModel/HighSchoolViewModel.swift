//
//  SchoolViewModel.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation

final class HighSchoolViewModel {
    private(set) var highSchools: [HighSchool]?
    private(set) var satResult: SatScore?
    var numberOfRows: Int {
        return highSchools?.count ?? 0
    }

    let dataManager: DataManager
    init(dataManager: DataManager = .shared) {
        self.dataManager = dataManager
    }
}

extension HighSchoolViewModel {

    func getHighSchoolData(_ reloadData: @escaping()->()) {
        Task {
            highSchools = try? await dataManager.loadHighSchoolData()
            reloadData()
        }
    }
    
    func getScore(for dbn: String, _ reloadData: @escaping()->()) {
        Task {
            satResult = try? await dataManager.loadSatScore(for: dbn)?.first
            reloadData()
        }
    }
}
