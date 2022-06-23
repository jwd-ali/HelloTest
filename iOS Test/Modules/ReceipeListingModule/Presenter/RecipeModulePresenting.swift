import Foundation
protocol RecipeModulePresenting {
  func onViewDidLoad()
  func onSelect(indexPath: IndexPath, recipe: RecipeCellViewModelType)
}
