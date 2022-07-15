//
//  AssetTest.swift
//  ProgressTrackerTests
//
//  Created by Miguel Quezada on 14-07-22.
//

import XCTest

@testable import ProgressTracker

class AssetTest: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }
    func testJSONLoadsCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }

}
