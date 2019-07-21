

/// Methods by which Pokémon can learn moves.
public struct MoveLearnMethod: LocalizableNamedEntity, Decodable {
    public let id: Int
    public let name: String
    /// The description of this resource listed in different languages
    public let descriptions: [Description]
    public let names: [Name]
    /// A list of version groups where moves can be learned through this method.
    public let versionGroups: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, descriptions, names
        case versionGroups = "version_groups"
    }
}
