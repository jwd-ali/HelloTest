import XCTest
@testable import iOS_Test
class RecipeResponseModelMapperTests: XCTestCase {
  private var sut: RecipeResponseModelMapper!
    override func setUpWithError() throws {
      sut = RecipeResponseModelMapper()
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }

  func testMapping() {
    let recipeResponse = try! [RecipeResponse].parse(fileName: "recipes_v3", fileType: "json", bundle: Bundle.main)[0]
    let recipeViewModel = sut.recipe(from: recipeResponse)
    XCTAssertEqual(recipeResponse.recipeName, recipeViewModel.name)
  }
}
