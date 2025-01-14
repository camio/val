/// A tuple expression.
public struct TupleExpr: Expr {

  public static let kind = NodeKind.tupleExpr

  /// An element in a tuple expression.
  public struct Element: Codable {

    /// The label of the element.
    public var label: SourceRepresentable<Identifier>?

    /// The value of the element.
    public var value: AnyExprID

    public init(label: SourceRepresentable<Identifier>? = nil, value: AnyExprID) {
      self.label = label
      self.value = value
    }

  }

  /// The elements of the tuple.
  public var elements: [Element]

  public init(elements: [Element] = []) {
    self.elements = elements
  }

}
