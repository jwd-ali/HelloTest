import Foundation
protocol CountChecking {
  mutating func isMaximumCountReach(isSelected: Bool)-> Bool
}

struct CountChecker: CountChecking {
  private var selectedCount: uint
  private let maxCount: uint

  init(maxCount: uint = 5, selectedCount: uint = 0) {
    self.maxCount = maxCount
    self.selectedCount = selectedCount
  }

  mutating func isMaximumCountReach(isSelected: Bool)-> Bool {
    if selectedCount < maxCount || !isSelected  {
      selectedCount = isSelected ? (selectedCount + 1) : (selectedCount - 1)
      return true
    }
    return false
  }
}
