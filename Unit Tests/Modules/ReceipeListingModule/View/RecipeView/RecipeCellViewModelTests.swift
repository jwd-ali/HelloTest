import XCTest
@testable import iOS_Test
class RecipeCellViewModelTests: XCTestCase {
  private var sut: MockRecipeCellViewModel!

  override func setUpWithError() throws {
    sut = MockRecipeCellViewModel()
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testSelectionOfModel() {
    let notSelected = sut.isSelected
    sut.toggleSelected()
    let selected = sut.isSelected
    XCTAssertNotEqual(notSelected, selected)
  }

  func testRecipeCellSetGet() {
    XCTAssertEqual(sut.name, "pizza")
    XCTAssertEqual(sut.preparationTime, 45)
    XCTAssertEqual(sut.id, "6")
  }
}
