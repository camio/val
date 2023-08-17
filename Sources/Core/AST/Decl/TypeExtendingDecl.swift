/// A declaration that extends a type.
public protocol TypeExtendingDecl: ExposableDecl, GenericScope {

  /// The expression of the extended type.
  var subject: AnyExprID { get }

  /// The condition of the extension, if any.
  var whereClause: SourceRepresentable<WhereClause>? { get }

  /// The member declarations in the lexical scope of this declaration.
  var members: [AnyDeclID] { get }

}

extension TypeExtendingDecl {

  public func validateForm(in ast: AST, into diagnostics: inout DiagnosticSet) {
    for m in members {
      switch m.kind {
      case ConformanceDecl.self:
        diagnostics.insert(.error(unexpected: ConformanceDecl.ID(m)!, in: ast))
      case ExtensionDecl.self:
        diagnostics.insert(.error(unexpected: ExtensionDecl.ID(m)!, in: ast))
      case InitializerDecl.self:
        let d = InitializerDecl.ID(m)!
        if ast[d].isMemberwise {
          diagnostics.insert(.error(unexpectedMemberwiseInitializerDecl: ast[d]))
        }
      default:
        continue
      }
    }
  }

}
