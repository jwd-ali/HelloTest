import Foundation
enum ServiceError: Error {
  case resourceNotFound
  case dataCorrupted
}

extension ServiceError: LocalizedError {
  public var errorDescription: String? {
    switch self {
      case .resourceNotFound:
        return "file with specific name not found"
      case .dataCorrupted:
        return "data is not in correct format"
    }
  }
}
