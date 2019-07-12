
/// A generation is a grouping of the Pokémon games that separates them based on the Pokémon they include. In each generation, a new set of Pokémon, Moves, Abilities and Types that did not exist in the previous generation are released
public struct Generation: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// A list of abilities that were introduced in this generation.
    public let abilities: [NamedAPIResource]
    public let names: [Name]
    /// The main grion introduced in this generation.
    public let mainRegion: NamedAPIResource
    /// A list of moves that were introduced in this generation.
    public let moves: [NamedAPIResource]
    /// A list of Pokémon species that were introduced in this generation.
    public let pokemonSpecies: [NamedAPIResource]
    /// A list of types that were introduced in this generation.
    public let types: [NamedAPIResource]
    /// A list of version groups that were introduced in this generation.
    public let versionGroups: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, abilities, names, moves, types
        case mainRegion = "main_region"
        case pokemonSpecies = "pokemon_species"
        case versionGroups = "version_groups"
    }
}
