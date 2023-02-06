import Core

/// A C++ scoped block -- multiple statements in curly braces
struct CXXScopedBlock: CXXStmt {

  /// The statements in the scoped block.
  let stmts: [CXXStmt]

}
