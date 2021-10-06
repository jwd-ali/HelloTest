//
//  Float+ExtensionTests.swift
//  Unit Tests
//
//  Created by Jawad Ali on 16/08/2021.
//

import XCTest
@testable import iOS_Test
class Float_ExtensionTests: XCTestCase {
  func testFloatToStringConvertion() {
    let minutes: Float = 50
    let expectedOutput = "50 min"
    XCTAssertEqual(expectedOutput, minutes.minutesString)
  }
}
