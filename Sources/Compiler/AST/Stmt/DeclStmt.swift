/// A declaration statement.
public struct DeclStmt: Stmt {

  public static let kind = NodeKind.declStmt

  /// The declaration.
  public var decl: AnyDeclID

  public init(decl: AnyDeclID) {
    self.decl = decl
  }

}
