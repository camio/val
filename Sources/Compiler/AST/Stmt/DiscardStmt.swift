/// A discard statement.
public struct DiscardStmt: Stmt {

  public static let kind = NodeKind.discardStmt

  /// The expression whose value is discarded.
  public var expr: AnyExprID

  public init(expr: AnyExprID) {
    self.expr = expr
  }

}
