import Foundation
protocol RecipeResponseType: Decodable {
  var identifier: String { get }
  var recipeName: String { get }
  var recipeHeadline: String { get }
  var imageURL: URL { get }
  var preprationTime: Float { get }
}

struct RecipeResponse: RecipeResponseType {
    let identifier: String
    let recipeName: String
    let recipeHeadline: String
    let imageURL: URL
    let preprationTime: Float
}

private extension RecipeResponse {
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case recipeName = "name"
        case recipeHeadline = "headline"
        case imageURL = "image"
        case preprationTime = "preparation_minutes"
    }
}
