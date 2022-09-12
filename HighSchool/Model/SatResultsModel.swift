//
//  SatResultsModel.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/9/22.
//

import Foundation

struct SatScore: Codable {
    let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore, satMathAvgScore, satWritingAvgScore: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}

