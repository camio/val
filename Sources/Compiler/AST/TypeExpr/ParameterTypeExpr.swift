/// A parameter in a lambda type expression.
public struct ParameterTypeExpr: TypeExpr {

  public static let kind = NodeKind.parameterTypeExpr

  /// The passing convention of the parameter.
  public var convention: SourceRepresentable<PassingConvention>

  /// The expression of the parameter's bare type.
  public var bareType: AnyTypeExprID

  public init(
    convention: SourceRepresentable<PassingConvention>,
    bareType: AnyTypeExprID
  ) {
    self.convention = convention
    self.bareType = bareType
  }

}
