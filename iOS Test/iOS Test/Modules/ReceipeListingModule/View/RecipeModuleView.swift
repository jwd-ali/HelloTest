import Foundation
protocol RecipeModuleView: AnyObject {
  func updateView(recipeViewModels: [RecipeCellViewModelType])
  func updateTitle(title: String)
  func showErrorMessage(errorMessage: String)
  func updateRecipe(at indexPath: IndexPath, with recipe: RecipeCellViewModelType)
}
