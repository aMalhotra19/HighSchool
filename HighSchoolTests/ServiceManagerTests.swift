//
//  ServiceManagerTests.swift
//  HighSchoolTests
//
//  Created by Anju Malhotra on 9/11/22.
//

import XCTest
@testable import HighSchool

class ServiceManagerTests: XCTestCase {
    private var mock: ServiceManagerMock!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mock = ServiceManagerMock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mock = nil
    }

    func testFetchScore() async {
        let result = try? await mock.fetchScore(from: "", for: "")
        XCTAssertEqual(result?.count, 0)
        
        let result1 = try? await mock.fetchScore(from: "test", for: "test")
        XCTAssertEqual(result1?.count, 1)
    }

    func testFetchSchool() async {
        let result = try? await mock.fetchSchool(from: "")
        XCTAssertEqual(result?.count, 0)
        
        let result1 = try? await mock.fetchSchool(from: "test")
        XCTAssertEqual(result1?.count, 1)
    }
    
    private class ServiceManagerMock: ApiService {

        func fetchScore(from urlString: String, for schoolWithDBN: String) async throws -> [SatScore]? {
            if !urlString.isEmpty && !schoolWithDBN.isEmpty{
                return [SatScore(dbn: "Test", schoolName: "Test", numOfSatTestTakers: "Test", satCriticalReadingAvgScore: "Test", satMathAvgScore: "Test", satWritingAvgScore: "Test")]
            }
            return []
        }
        
        func fetchSchool(from urlString: String) async throws -> [HighSchool]? {
            if !urlString.isEmpty {
                return [HighSchool(dbn: "Test", schoolName: "Test", website: "Test", totalStudents: "Test", email: "Test", phone: "Test")]
            }
            return []
        }
    }
}
