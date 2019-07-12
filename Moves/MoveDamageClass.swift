
/// Damage classes moves can have, e.g. physical, special, or non-damaging
public struct MoveDamageClass: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// The description of this resource listed in different languages
    public let descriptions: [Description]
    /// A list of moves that fall into this damage class
    public let moves: [NamedAPIResourceList]
    public let names: [Name]
}
