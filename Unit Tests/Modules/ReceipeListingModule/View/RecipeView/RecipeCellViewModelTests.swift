import XCTest
@testable import iOS_Test
class RecipeCellViewModelTests: XCTestCase {
  private var sut: RecipeCellViewModel!

  override func setUpWithError() throws {
    sut = RecipeCellViewModel.mock
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testRecipeCellSetGet() {
    XCTAssertEqual(sut.name, "pizza")
    XCTAssertEqual(sut.preparationTime, 45)
    XCTAssertEqual(sut.id, "6")
  }
}

extension RecipeCellViewModel {
 static var mock: RecipeCellViewModel {
    RecipeCellViewModel(id: "6", name: "pizza", headline: "", image: URL(string: "www.hellofresh.com")!, preparationTime: 45)
  }
}
