import XCTest
@testable import iOS_Test
final class RecipeModulePresenterTests: XCTestCase {

  private var sut: RecipeModulePresenter<MockRecipeModuleView>!
  private var mapper: MockRecipeResponseModelMapper!
  private var view: MockRecipeModuleView!
  private var interactor: MockRecipeModuleInteractor!

  override func setUpWithError() throws {
    view = MockRecipeModuleView()
    mapper = MockRecipeResponseModelMapper()
    interactor = MockRecipeModuleInteractor()

    sut = RecipeModulePresenter(
      interactor: interactor,
      router: MockRecipeRouter(),
      mapper: mapper,
      checking: MockCounterCheck())
    sut.view = view
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  func testOnSelect() {
    sut.onSelect(indexPath: IndexPath(row: 0, section: 0), recipe: mapper.recipe(from: RecipeResponse.mock[0]))

    XCTAssertTrue(view.isUpdateRecipe)
  }

  func testErrorToLoad() {
    interactor.isError = true

    sut.onViewDidLoad()

    XCTAssertTrue(view.isErrorViewShown)
  }
}

final class MockRecipeModuleInteractor: RecipeModuleInteracting {
  var isError: Bool = false

  func recipeList(completion: @escaping (Result<[RecipeResponse], ServiceError>) -> Void) {
    if isError {
      completion(.failure(.dataCorrupted))
    } else {
      completion(.success(RecipeResponse.mock as! [RecipeResponse]))
    }
  }
}

final class MockRecipeRouter: RecipeRouting {
  var viewController: UIViewController? = UIViewController()
}

final class MockRecipeResponseModelMapper: RecipeResponseModelMapping {
  func recipe(from model: RecipeResponseType) -> RecipeCellViewModelType {
    RecipeCellViewModel(id: "6", name: "pizza", headline: "", image: URL(string: "www.helloFresh.com")!, preparationTime: 45, isSelected: true)
  }
}

final class MockRecipeModuleView: RecipeModuleView {
  var isUpdateRecipe: Bool = false
  var isErrorViewShown = false

  func updateView(recipeViewModels: [RecipeCellViewModelType]) {}

  func updateTitle(title: String) {}

  func showErrorMessage(errorMessage: String) {
    isErrorViewShown = true
  }

  func updateRecipe(at indexPath: IndexPath, with recipe: RecipeCellViewModelType) {
    isUpdateRecipe = true
  }
}

final class MockCounterCheck: CountChecking {
  var isMaximumReach = false
  func isMaximumCountReach(isSelected: Bool) -> Bool {
    !isMaximumReach
  }
}

extension RecipeResponse {
  static var mock: [RecipeResponseType] {
    [RecipeResponse(identifier: "6", recipeName: "", recipeHeadline: "", imageURL: URL(string: "www.helloFresh.com")!, preprationTime: 45)]
  }
}
