//
//  Decodable+ExtensionTests.swift
//  Unit Tests
//
//  Created by Jawad Ali on 16/08/2021.
//

import XCTest
@testable import iOS_Test
class Decodable_ExtensionTests: XCTestCase {

  func testFileNotExistErrorCase() {
    XCTAssertThrowsError(try RecipeResponse.parse(fileName: "recipes", fileType: "json", bundle: Bundle.main)) { error in
      XCTAssertEqual(error as! DecodeError, DecodeError.resourceNotFound)
    }
  }

  func testParsingErrorCase() {
    XCTAssertThrowsError(try RecipeResponse.parse(fileName: "recipes_v3", fileType: "json", bundle: Bundle.main)) { error in
      XCTAssertNotNil(error)
    }
  }

  func testSuccessfullParsing() throws {
    let recipes = try [RecipeResponse].parse(fileName: "recipes_v3", fileType: "json", bundle: Bundle.main)
    XCTAssertTrue(recipes.count > 0)
  }

  func testfailParsing() throws {
    let recipe = try? RecipeResponse.parse(fileName: "recipes_v3", fileType: "json", bundle: Bundle.main)
    XCTAssertNil(recipe)
  }

}
