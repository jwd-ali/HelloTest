import Foundation
typealias ServiceResult<T> = (Result<T, ServiceError>) -> Void

protocol RecipeServicing {
  func getRecipes<T: Decodable>(completion:@escaping ServiceResult<T>)
}
