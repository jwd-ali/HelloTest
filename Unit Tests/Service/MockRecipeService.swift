import Foundation
@testable import iOS_Test
class MockRecipeServiceCorruptedData: RecipeServicing {
  func getRecepies<T>(completion: @escaping ServiceResult<T>) where T : Decodable {
    completion(.failure(.dataCorrupted))
  }
}
