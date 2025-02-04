/// An argument of a function or subscript call.
public struct CallArgument: Codable {

  /// The label of the argument, if any.
  public var label: SourceRepresentable<Identifier>?

  /// The value of the argument.
  public var value: AnyExprID

  public init(label: SourceRepresentable<Identifier>? = nil, value: AnyExprID) {
    self.label = label
    self.value = value
  }

}
