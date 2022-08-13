import Foundation
final class RecipeModulePresenter<View: RecipeModuleView> {
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

extension RecipeModulePresenter: RecipeModulePresenting {
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
    let canSelect = checker.isMaximumCountReach(isSelected: getRecipe.isSelected)
    if canSelect {
      getRecipe.isSelected = canSelect
      view?.updateRecipe(at: indexPath, with: getRecipe)
    }
  }
}
