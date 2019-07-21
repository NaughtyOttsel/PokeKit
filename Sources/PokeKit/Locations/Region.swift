

/// A region is an organized area of the pokémon world. Most often, the main difference between regions is the species of pokémon that can be encountered within them.
public struct Region: LocalizableNamedEntity, Decodable {
    public let id: Int
    /// A list of locations that can be found in this region
    public let locations: [NamedAPIResource]
    public let name: String
    public let names: [Name]
    /// The generation this region was introduced in
    public let mainGeneration: NamedAPIResource
    /// A list of pokédexes that catalogue pokemon in this region
    public let pokedexes: [NamedAPIResource]
    /// A list of version groups where this region can be visited
    public let versionGroups: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names, locations, pokedexes
        case mainGeneration = "main_generation"
        case versionGroups = "version_groups"
    }
}
