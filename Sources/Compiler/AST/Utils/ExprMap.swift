/// A mapping from indices of expressions to properties of a given type.
public struct ExprMap<Value> {

  /// The internal storage of the map.
  public var storage: [AnyExprID: Value]

  /// Creates an empty node map.
  public init() {
    storage = [:]
  }

  /// Accesses the property associated with the specified ID.
  public subscript<T: ExprID>(id: T) -> Value? {
    _read { yield storage[AnyExprID(id)] }
    _modify { yield &storage[AnyExprID(id)] }
  }

  /// Accesses the property associated with the specified ID.
  public subscript<T: ExprID>(
    id: T,
    default defaultValue: @autoclosure () -> Value
  ) -> Value {
    _read {
      yield storage[AnyExprID(id), default: defaultValue()]
    }
    _modify {
      var value = storage[AnyExprID(id)] ?? defaultValue()
      defer { storage[AnyExprID(id)] = value }
      yield &value
    }
  }

}

extension ExprMap: Equatable where Value: Equatable {}

extension ExprMap: Hashable where Value: Hashable {}

extension ExprMap: Codable where Value: Codable {}
