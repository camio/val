/// A trait declaration.
public struct TraitDecl: SingleEntityDecl, GenericScope {

  public static let kind = NodeKind.traitDecl

  /// The access modifier of the declaration, if any.
  public var accessModifier: SourceRepresentable<AccessModifier>?

  /// The identifier of the trait.
  public var identifier: SourceRepresentable<Identifier>

  /// The names of traits which the trait refines.
  public var refinements: [NodeID<NameTypeExpr>]

  /// The member declarations in the lexical scope of the trait.
  public var members: [AnyDeclID]

  public init(
    accessModifier: SourceRepresentable<AccessModifier>? = nil,
    identifier: SourceRepresentable<Identifier>,
    refinements: [NodeID<NameTypeExpr>] = [],
    members: [AnyDeclID] = []
  ) {
    self.accessModifier = accessModifier
    self.identifier = identifier
    self.refinements = refinements
    self.members = members
  }

  public var name: String { identifier.value }

}
