import Foundation
class RecipeModuleInteractor: RecipeModuleInteracting {
  private let service: RecipeServicing

  // MARK: - initialiser
  init(service: RecipeServicing) {
    self.service = service
  }

  func recipeList(completion: @escaping (Result<[RecipeResponse], ServiceError>)-> Void) {
    service.getRecipes(completion: completion)
  }
}
