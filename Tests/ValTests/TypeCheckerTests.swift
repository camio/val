import XCTest
import Compiler
import Utils

final class TypeCheckerTests: XCTestCase {

  func testTypeChecker() throws {
    // Locate the test cases.
    let testCaseDirectory = try XCTUnwrap(
      Bundle.module.url(forResource: "TestCases/TypeChecking", withExtension: nil),
      "No test cases")

    // Prepare an AST with the core module loaded.
    var baseAST = AST()
    try baseAST.importValModule()

    // Execute the test cases.
    try TestCase.executeAll(in: testCaseDirectory, { (tc) in
      // Create an AST for the test case.
      var program = baseAST

      // Create a module for the input.
      let module = program.insert(ModuleDecl(name: tc.name))

      // Parse the input.
      if Parser.parse(tc.source, into: module, in: &program).decls == nil {
        XCTFail("\(tc.name): parsing failed")
        return
      }

      // Run the type checker.
      var checker = TypeChecker(ast: program)
      let success = checker.check(module: module)

      // Create a diagnostic checker.
      var diagnosticChecker = DiagnosticChecker(
        testCaseName: tc.name, diagnostics: checker.diagnostics)

      // Process the test annotations.
      for annotation in tc.annotations {
        switch annotation.command {
        case "expect-failure":
          XCTAssert(!success, "\(tc.name): type checking succeeded, but expected failure")
        case "expect-success":
          XCTAssert(success, "\(tc.name): type checking failed, but expected success")
        case "diagnostic":
          diagnosticChecker.handle(annotation)
        default:
          print("\(tc.name): unexpected test command: '\(annotation.command)'")
        }
      }

      diagnosticChecker.finalize()
    })
  }

}
