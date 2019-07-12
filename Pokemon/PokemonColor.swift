
/// Colors used for sorting Pokémon in a Pokédex. The color listed in the Pokédex is usually the color most apparent or covering each Pokémon's body. No orange category exists; Pokémon that are primarily orange are listed as red or brown
public struct PokemonColor: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A list of the Pokémon species that have this color
    public let pokemonSpecies: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}
