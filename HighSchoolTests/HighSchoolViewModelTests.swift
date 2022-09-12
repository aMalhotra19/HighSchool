//
//  HighSchoolViewModelTests.swift
//  HighSchoolTests
//
//  Created by Anju Malhotra on 9/11/22.
//

import XCTest
@testable import HighSchool

class modelTest: XCTestCase  {
    private var stub: DataManagerStub!
    private var model: HighSchoolViewModel!
    
    override func setUpWithError() throws {
        stub = DataManagerStub(serviceManager: ServiceManager())
        model = HighSchoolViewModel(dataManager: stub)
    }
    
    override func tearDownWithError() throws {
        model = nil
    }
    
    func testGetHighSchoolData() {
        let exp = expectation(description: "Wait for result")
        model.getHighSchoolData {
            XCTAssertEqual(self.model.highSchools?.count, 1)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
    func testGetScore() {
        let exp = expectation(description: "Wait for result")
        model.getScore(for: "test") {
            XCTAssertNotNil(self.model.satResult)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
    private class DataManagerStub: DataManager {
        override func loadHighSchoolData() async throws -> [HighSchool]? {
            return [HighSchool(dbn: "test", schoolName: "test", website: "test", totalStudents: "test", email: "test", phone: "test")]
        }
        
        override func loadSatScore(for schoolWithDBN: String) async throws -> [SatScore]? {
            return [SatScore(dbn: "test", schoolName: "test", numOfSatTestTakers: "test", satCriticalReadingAvgScore: "test", satMathAvgScore: "test", satWritingAvgScore: "test")]
        }
    }
}

