

/// Evolution triggers are the events and conditions that cause a pokémon to evolve
public struct EvolutionTrigger: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A list of pokémon species that result from this evolution trigger
    public let pokemonSpecies: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}
