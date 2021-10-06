import Foundation
typealias ServiceResult<T> = (Result<T, ServiceError>) -> Void

protocol RecipeServicing {
  func getRecepies<T: Decodable>(completion:@escaping ServiceResult<T>)
}
