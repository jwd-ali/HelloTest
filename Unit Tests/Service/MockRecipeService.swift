import Foundation
@testable import iOS_Test
class MockRecipeServiceCorruptedData: RecipeServicing {
  func getRecipes<T>(completion: @escaping ServiceResult<T>) where T : Decodable {
    completion(.failure(.dataCorrupted))
  }
}
