
/// Egg Groups are categories which determine which Pokémon are able to interbreed. Pokémon may belong to either one or two Egg Groups
public struct EggGroup: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A list of all Pokémon species that are members of this egg group
    public let pokemonSpecies: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}
