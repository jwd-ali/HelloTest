import Foundation
struct RecipeResponseModelMapper: RecipeResponseModelMapping {
  func recipe(from model: RecipeResponseType) -> RecipeCellViewModelType {
    return RecipeCellViewModel(
      id: model.identifier,
      name: model.recipeName,
      headline: model.recipeHeadline,
      image: model.imageURL,
      preparationTime: model.preprationTime
    )
  }


}
