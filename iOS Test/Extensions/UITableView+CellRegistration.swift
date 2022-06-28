import UIKit
typealias ReusableTableViewCell = UITableViewCell & ReusableCell

extension UITableView {

  final func register<T: UITableViewCell>(cellType: T.Type)
  where T: ReusableCell {
    register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
  }

  private func dequeueCellOf(
    type: ReusableCell.Type,
    for indexPath: IndexPath?
  ) -> ReusableTableViewCell {

    let identifier = type.reuseIdentifier
    let cell: ReusableTableViewCell?
    if let indexPath = indexPath {
      cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ReusableTableViewCell
    } else {
      cell = dequeueReusableCell(withIdentifier: identifier) as? ReusableTableViewCell
    }
    guard let finalCell = cell else {
      fatalError(
        "Can't dequeue cell with identifier \(identifier) of type \(type)."
          + "Make sure reuseIdentifier is Correct"
          + "And If you are using XIB, make sure you called tableView.register(CellType)"
      )
    }
    return finalCell
  }

  final func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
    let identifier: String
    if let reusable = type as? Reusable.Type {
      identifier = reusable.reuseIdentifier
    } else {
      identifier = String(describing: type)
    }
    guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
      fatalError(
        "Can't dequeue cell with identifier \(identifier) of type \(type)."
          + "Make sure reuseIdentifier is correct."
          + "And If you are using XIB, make sure you called tableView.register(CellType)"
      )
    }
    return cell
  }

  final func dequeueReusableCellOf(type: ReusableCell.Type, for indexPath: IndexPath) -> ReusableTableViewCell {
    return dequeueCellOf(type: type, for: indexPath)
  }

  final func dequeueReusableCellOf(type: ReusableCell.Type) -> ReusableTableViewCell {
    return dequeueCellOf(type: type, for: nil)
  }
}
