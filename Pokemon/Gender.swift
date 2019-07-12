
/// Genders were introduced in Generation II for the purposes of breeding Pokémon but can also result in visual differences or even different evolutionary lines
public struct Gender: Entity, Decodable {
    public let id: Int
    public let name: String
    /// A list of Pokémon species that can be this gender and how likely it is that they will be.
    public let pokemonSpeciesDetails: [PokemonSpeciesGender]
    /// A list of Pokémon species that required this gender in order for a Pokémon to evolve into them.
    public let requiredForEvolution: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name
        case pokemonSpeciesDetails = "pokemon_species_details"
        case requiredForEvolution = "required_for_evolution"
    }
}

public struct PokemonSpeciesGender: Decodable {
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    public let rate: Int
    /// A Pokémon species that can be the referenced gender
    public let pokemonSpecies: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case rate
        case pokemonSpecies = "pokemon_species"
    }
}
