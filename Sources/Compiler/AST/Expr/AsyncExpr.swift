/// An expression ran in a future.
public struct AsyncExpr: Expr {

  public static let kind = NodeKind.asyncExpr

  /// The declaration of the underlying anonymous function.
  public var decl: NodeID<FunDecl>

  public init(decl: NodeID<FunDecl>) {
    self.decl = decl
  }

}
