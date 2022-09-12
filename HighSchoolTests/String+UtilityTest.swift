//
//  String+UtilityTest.swift
//  HighSchoolTests
//
//  Created by Anju Malhotra on 9/11/22.
//

import XCTest
@testable import HighSchool

class String_UtilityTest: XCTestCase {
    func testCamelCase() {
        XCTAssertEqual("someString".camelCased(), "Somestring")
    }
}
