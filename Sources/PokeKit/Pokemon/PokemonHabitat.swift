

/// Habitats are generally different terrain Pokémon can be found in but can also be areas designated for rare or legendary Pokémon
public struct PokemonHabitat: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A list of the Pokémon species that can be found in this habitat
    public let pokemonSpecies: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}
