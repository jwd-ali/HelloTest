import Foundation

typealias RecipeCellViewModelType = ReusableCellViewModel & RecipeCellViewModeling

protocol RecipeCellViewModeling  {
  var id: String { get }
  var name: String { get }
  var headline: String { get }
  var image: URL { get }
  var preprationTime: Float { get }
  var isSelected: Bool { get set }
  mutating func toogleSelected()
}

struct RecipeCellViewModel: RecipeCellViewModelType {
  let cellType: ReusableCell.Type = RecipeTableViewCell.self
  let id: String
  let name: String
  let headline: String
  let image: URL
  let preprationTime: Float
  var isSelected: Bool = false

  mutating func toogleSelected() {
    isSelected.toggle()
  }
}
