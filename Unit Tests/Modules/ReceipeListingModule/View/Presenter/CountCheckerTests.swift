import XCTest
@testable import iOS_Test
final class CountCheckerTests: XCTestCase {
  private var sut: CountChecker!

  override func setUpWithError() throws {
    sut = CountChecker()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testIsRecipeCountReach() {
    XCTAssertTrue(sut.isMaximumCountReach(isSelected: true))
  }

  func testOverloadSelection() {
    sut = CountChecker(selectedCount: 5)
    XCTAssertFalse(sut.isMaximumCountReach(isSelected: true))
  }

}
