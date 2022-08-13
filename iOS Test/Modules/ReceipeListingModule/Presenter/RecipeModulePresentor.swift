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
  // MARK: - initializer
  init(
    interactor: RecipeModuleInteracting,
    router: RecipeRouting,
    mapper: RecipeResponseModelMapping
  ) {
    self.interactor = interactor
    self.router = router
    self.mapper = mapper
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
    getRecipe.toggleSelected()
    if selectedCount < maxCount || !getRecipe.isSelected  {
      selectedCount = getRecipe.isSelected ? (selectedCount + 1) : (selectedCount - 1)
      view?.updateRecipe(at: indexPath, with: getRecipe)
    }
  }
}
