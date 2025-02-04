/// A boolean literal expression.
public struct BooleanLiteralExpr: Expr {

  public static let kind = NodeKind.booleanLiteralExpr

  /// The value of the literal.
  public var value: Bool

  public init(value: Bool) {
    self.value = value
  }

}
