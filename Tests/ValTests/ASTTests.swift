import XCTest
import Compiler

final class ASTTests: XCTestCase {

  func testAppendModule() {
    var ast = AST()
    let i = ast.insert(ModuleDecl(name: "Val", sources: []))
    XCTAssert(ast.modules.contains(i))
  }

  func testDeclAccess() throws {
    var ast = AST()

    // Create a module declarations.
    let module = ast.insert(ModuleDecl(name: "Val", sources: []))

    // Create a source declaration set.
    let source = ast.insert(TopLevelDeclSet())
    ast[module].sources.append(source)

    // Create a trait declaration.
    let trait = ast.insert(TraitDecl(
      accessModifier: nil,
      identifier: SourceRepresentable(value: "T"),
      refinements: [],
      members: []))
    ast[source].decls.append(AnyDeclID(trait))

    // Subscript the AST for reading with a type-erased ID.
    XCTAssert(ast[ast[ast[module].sources.first!].decls.first!] is TraitDecl)
  }

}
