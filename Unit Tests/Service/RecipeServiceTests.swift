import XCTest
@testable import iOS_Test

class RecipeServiceTests: XCTestCase {
  private var sut: RecipeServicing!

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testFileNotFoundErrorCase() {
    let fileLoader = FileLoader(fileName: "recipes", bundle:Bundle.main , fileType: "json")
    var results: Result<[RecipeResponse], ServiceError>?
    sut = RecipeService(fileLoader: fileLoader)
    sut.getRecipes { (result: Result<[RecipeResponse], ServiceError>) in
      results = result
    }

    XCTAssertThrowsError(try results?.get()) { error in
      XCTAssertEqual(error as! ServiceError, ServiceError.resourceNotFound)

    }
  }

  func testCorruptedDataCase() {
    sut = MockRecipeServiceCorruptedData()
    var results: Result<[RecipeResponse], ServiceError>?
    sut.getRecipes { (result: Result<[RecipeResponse], ServiceError>) in
      results = result
    }
    XCTAssertThrowsError(try results?.get()) { error in
      XCTAssertEqual(error as! ServiceError, ServiceError.dataCorrupted)

    }
  }
}
