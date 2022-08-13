import Foundation

typealias RecipeCellViewModelType = ReusableCellViewModel & RecipeCellViewModeling

protocol RecipeCellViewModeling  {
  var id: String { get }
  var name: String { get }
  var headline: String { get }
  var image: URL { get }
  var preparationTime: Float { get }
  var isSelected: Bool { get set }
  mutating func toggleSelected()
}

struct RecipeCellViewModel: RecipeCellViewModelType {
  let cellType: ReusableCell.Type = RecipeTableViewCell.self
  let id: String
  let name: String
  let headline: String
  let image: URL
  let preparationTime: Float
  var isSelected: Bool = false

  mutating func toggleSelected() {
    isSelected.toggle()
  }
}
