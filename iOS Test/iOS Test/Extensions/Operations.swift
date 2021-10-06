import Foundation
infix operator ..

 // MARK:- this operator helps to create views programatically
public func .. <T>(lhs: @autoclosure () -> T, rhs: (inout T) -> Void) -> T {
  var value = lhs()
  rhs(&value)
  return value
}
