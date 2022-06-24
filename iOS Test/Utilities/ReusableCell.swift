import Foundation
protocol Reusable: AnyObject {
  static var reuseIdentifier: String { get }
}

extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

protocol ReusableCell: Reusable {
  func update(with viewModel: ReusableCellViewModel?)
}

protocol ReusableCellViewModel {
  var cellType: ReusableCell.Type { get }
}
