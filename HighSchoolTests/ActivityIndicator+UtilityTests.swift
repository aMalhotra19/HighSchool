//
//  HighSchoolTests.swift
//  HighSchoolTests
//
//  Created by Anju Malhotra on 9/9/22.
//

import XCTest
@testable import HighSchool

class ActivityIndicator_UtilityTests: XCTestCase {
    var activity: UIActivityIndicatorView?
    var view: UIView?
    
    override func setUp() {
        super.setUp()
        activity = UIActivityIndicatorView()
        view = UIView()
    }
    
    override func tearDown() {
        super.tearDown()
        activity = nil
        view = nil
    }
    
    func testActivity() {
        activity?.show(with: view ?? UIView())
        XCTAssertEqual(activity?.color, UIColor.brown)
        XCTAssertEqual(activity?.center, view?.center)
        XCTAssertEqual(view?.subviews.first, activity)
    }
    
    func testHideActivity() {
        activity?.show(with: view ?? UIView())
        activity?.hide()
        XCTAssertNil(view?.subviews.first)
    }
}
