import Foundation
protocol RecipeModuleInteracting {
  func recipeList(completion: @escaping (Result<[RecipeResponse], ServiceError>)-> Void)
}
