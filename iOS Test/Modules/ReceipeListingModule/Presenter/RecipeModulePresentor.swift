import Foundation
final class RecipeModulePresentor<View: RecipeModuleView> {
  private let screenTitle = "Recipes"

  // MARK:- Properties
  private let interactor: RecipeModuleInteracting
  private let router: RecipeRouting
  private let mapper: RecipeResponseModelMapping
  weak var view: View?
  private var selectedCount: Int = 0
  private let maxCount = 5
  private var checker: CountChecking
  // MARK: - initializer
  init(
    interactor: RecipeModuleInteracting,
    router: RecipeRouting,
    mapper: RecipeResponseModelMapping,
    checking: CountChecking
  ) {
    self.interactor = interactor
    self.router = router
    self.mapper = mapper
    self.checker = checking
  }

  private func getRecipes(mapper: RecipeResponseModelMapping, completion:@escaping (Result<[RecipeCellViewModelType], ServiceError>) -> Void ) {
    interactor.recipeList { (result) in
      completion(result.map { $0.map { mapper.recipe(from: $0) } })
    }
  }

}

extension RecipeModulePresentor: RecipeModulePresenting {
  func onViewDidLoad() {
    view?.updateTitle(title: screenTitle)
    getRecipes(mapper: mapper) { [weak self] (result) in
      switch result {
      case .failure(let error):
        self?.view?.showErrorMessage(errorMessage: error.localizedDescription)
      case .success(let recipes):
        self?.view?.updateView(recipeViewModels: recipes)
      }
    }
  }

  func onSelect(indexPath: IndexPath, recipe: RecipeCellViewModelType) {
    var getRecipe = recipe
    getRecipe.isSelected = checker.isMaximumCountReach(isSelected: getRecipe.isSelected)
    if checker.isMaximumCountReach(isSelected: getRecipe.isSelected) {
    view?.updateRecipe(at: indexPath, with: getRecipe)
    }
  }
}

protocol CountChecking {
  mutating func isMaximumCountReach(isSelected: Bool)-> Bool
}

struct CountChecker: CountChecking {
  private var selectedCount: Int = 0
  private let maxCount = 5

 mutating func isMaximumCountReach(isSelected: Bool)-> Bool {
    if selectedCount < maxCount || !isSelected  {
      selectedCount = isSelected ? (selectedCount + 1) : (selectedCount - 1)
      return false
    }

    return false
  }
}
