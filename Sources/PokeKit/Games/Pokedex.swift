

/// A Pokédex is a handheld electronic encyclopedia device; one which is capable of recording and retaining information of the various Pokémon in a given region with the exception of the national dex and some smaller dexes related to portions of a region
public struct Pokedex: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// Whether or not this Pokédex originated in the main series of the video games.
    public let isMainSeries: Bool
    /// The description of this resource listed in different languages
    public let descriptions: [Description]
    /// The name of this resource listed in different languages.
    public let names: [Name]
    /// A list of Pokémon catalogued in this Pokédex and their indexes
    public let pokemonEntries: [PokemonEntry]
    /// The region this Pokédex catalogues Pokémon for
    public let region: NamedAPIResource
    /// A list of version groups this Pokédex is relevant to.
    public let versionGroups: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, descriptions, names, region
        case isMainSeries = "is_main_series"
        case pokemonEntries = "pokemon_entries"
        case versionGroups = "version_groups"
    }
}

public struct PokemonEntry: Decodable {
    /// The index of this Pokémon species entry within the Pokédex.
    public let entryNumber: Int
    /// The Pokémon species this entry relates to.
    public let pokemonSpecies: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokemonSpecies = "pokemon_species"
    }
}
