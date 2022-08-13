import Foundation
@testable import iOS_Test
class MockRecipeCellViewModel: RecipeCellViewModeling {
  var id: String = "6"

  var name: String = "pizza"

  var headline: String = "great taste"

  var image: URL = URL(string: "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/53314247ff604d44808b4569.jpg")!

  var preparationTime: Float = 45

  var isSelected: Bool = false

  func toggleSelected() {
    isSelected.toggle()
  }
}
