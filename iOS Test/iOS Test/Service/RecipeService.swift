import Foundation
class RecipeService: RecipeServicing {
    private let loader: FileLoaderType

    init(fileLoader: FileLoaderType) {
        loader = fileLoader
    }

    func getRecepies<T: Decodable>(completion:@escaping ServiceResult<T>) {
        do {
            let recepies = try T.parse(fileName: loader.fileName, fileType: loader.fileType, bundle: loader.bundle)
            completion(.success(recepies))

        } catch DecodeError.resourceNotFound {
            completion(.failure(ServiceError.resourceNotFound))
        } catch {
            completion(.failure(ServiceError.dataCorrupted))
        }
    }
}
