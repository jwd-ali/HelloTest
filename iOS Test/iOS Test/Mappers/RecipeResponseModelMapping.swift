import Foundation
protocol RecipeResponseModelMapping {
  func recipe(from model: RecipeResponseType) -> RecipeCellViewModelType
}
