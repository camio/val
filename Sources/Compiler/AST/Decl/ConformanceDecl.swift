/// A declaration that extends a type with new conformances.
public struct ConformanceDecl: TypeExtendingDecl {

  public static let kind = NodeKind.conformanceDecl

  /// The access modifier of the declaration, if any.
  public var accessModifier: SourceRepresentable<AccessModifier>?

  /// The expression of the extended type.
  public var subject: AnyTypeExprID

  /// The names of traits to which conformance is declared.
  public var conformances: [NodeID<NameTypeExpr>]

  /// The condition of the conformance, if any.
  public var whereClause: SourceRepresentable<WhereClause>?

  /// The member declarations in the lexical scope of the conformance.
  public var members: [AnyDeclID]

  public init(
    accessModifier: SourceRepresentable<AccessModifier>? = nil,
    subject: AnyTypeExprID,
    conformances: [NodeID<NameTypeExpr>] = [],
    whereClause: SourceRepresentable<WhereClause>? = nil,
    members: [AnyDeclID] = []
  ) {
    self.accessModifier = accessModifier
    self.subject = subject
    self.conformances = conformances
    self.whereClause = whereClause
    self.members = members
  }

}
