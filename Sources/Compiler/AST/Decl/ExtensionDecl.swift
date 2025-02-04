/// A declaration that extends a type with new members.
public struct ExtensionDecl: TypeExtendingDecl {

  public static let kind = NodeKind.extensionDecl

  /// The access modifier of the declaration, if any.
  public var accessModifier: SourceRepresentable<AccessModifier>?

  /// The expression of the extended type.
  public var subject: AnyTypeExprID

  /// The condition of the extension, if any.
  public var whereClause: SourceRepresentable<WhereClause>?

  /// The member declarations in the lexical scope of the extension.
  public var members: [AnyDeclID]

  public init(
    accessModifier: SourceRepresentable<AccessModifier>? = nil,
    subject: AnyTypeExprID,
    whereClause: SourceRepresentable<WhereClause>? = nil,
    members: [AnyDeclID] = []
  ) {
    self.accessModifier = accessModifier
    self.subject = subject
    self.whereClause = whereClause
    self.members = members
  }

}
