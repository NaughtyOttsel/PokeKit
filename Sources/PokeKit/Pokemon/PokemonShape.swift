

/// Shapes used for sorting Pokémon in a Pokédex
public struct PokemonShape: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The "scientific" name of this Pokémon shape listed in different languages
    public let scientificNames: [ScientificName]
    public let names: [Name]
    /// A list of the Pokémon species that have this shape
    public let pokemonSpecies: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case scientificNames = "awesome_names"
        case pokemonSpecies = "pokemon_species"
    }
}

public struct ScientificName: MultiLanguageSupporting, Decodable {
    /// The language this "scientific" name is in.
    public let language: NamedAPIResource
    /// The localized "scientific" name for an API resource in a specific language
    public let scientificName: String

    private enum CodingKeys: String, CodingKey {
        case language
        case scientificName = "awesome_name"
    }
}
