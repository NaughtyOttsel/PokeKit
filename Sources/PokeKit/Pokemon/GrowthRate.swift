/// Growth rates are the speed with which Pokémon gain levels through experience
public struct GrowthRate: Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The formula used to calculate the rate at which the Pokémon species gains level
    public let formula: String
    /// The descriptions of this characteristic listed in different languages
    public let descriptions: [Description]
    /// A list of levels and the amount of experienced needed to atain them based on this growth rate
    public let levels: [GrowthRateExperienceLevel]
    /// A list of Pokémon species that gain levels at this growth rate.
    public let pokemonSpecies: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, formula, descriptions, levels
        case pokemonSpecies = "pokemon_species"
    }
}

public struct GrowthRateExperienceLevel: Decodable {
    /// The level gained
    public let level: Int
    /// The amount of experience required to reach the referenced level
    public let experience: Int
}
