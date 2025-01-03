//
//  tests.swift
//  Tests to verify RandomSelectionKit 
//
//  Created by f0xb17 on 01/03/2025.
//  Copyright © 2025 f0xb17. All rights reserved.
//

import XCTest
@testable import RandomSelectionKit

final class RandomSelectionKitTests: XCTestCase {
  func testExample() throws {
    XCTAssertTrue(type(of : returnRandomValue(10)) == Int.self, "returnRandomValue should return an Int")
    XCTAssertEqual(try readFile("test.txt"), ["User1", "User2", "User3", "User4", "User5", "User6"], "readFile should return an array of strings")
    XCTAssertThrowsError(try readFile("bla.txt"), "readFile should throw an error")
  }
}
