/// A tuple type expression.
public struct TupleTypeExpr: TypeExpr {

  public static let kind = NodeKind.tupleTypeExpr

  /// An element in a tuple type expression.
  public struct Element: Codable {

    /// The label of the element.
    public var label: SourceRepresentable<Identifier>?

    /// The type expression of the element.
    public var type: AnyTypeExprID

    public init(label: SourceRepresentable<Identifier>? = nil, type: AnyTypeExprID) {
      self.label = label
      self.type = type
    }

  }

  /// The elements of the tuple.
  public var elements: [Element]

  public init(elements: [Element] = []) {
    self.elements = elements
  }

}
